import 'dart:async';
import 'package:clubpro/api/api_auth.dart';
import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

enum SecurityState { loggedout, loggedin }

class SecurityAccount {
  final String login;
  final String password;

  SecurityAccount(this.login, this.password);
}

class SecurityService {
  String? _jwt;
  SecurityAccount? _account;
  UserAccount? _currentUser;
  late SecurityState _state;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BehaviorSubject<SecurityState> _stateUpdateController = BehaviorSubject();
  final BehaviorSubject<UserAccount?> _userUpdateController = BehaviorSubject();
  late final Stream<SecurityState> securityStateStream;
  late final Stream<UserAccount?> userAccountStream;

  SecurityService() {
    securityStateStream = _stateUpdateController.stream;
    userAccountStream = _userUpdateController.stream;
    _state = SecurityState.loggedout;
    _stateUpdateController.add(SecurityState.loggedout);
    _userUpdateController.add(null);
  }

  String? get jwt => _jwt;
  SecurityAccount? get account => _account;
  UserAccount? get currentUser => _currentUser;

  void setCurrentUser(UserAccount? user) {
    _setState(_state, user);
  }

  Future<void> init() async {
    var login = await _storage.read(key: 'login');
    var password = await _storage.read(key: 'password');
    if (login != null && password != null) {
      await this.login(login, password, persist: false);
    }
  }

  Future<UserAccount?> login(String login, String password, {bool persist = true}) async {
    var token = await ApiAuth.getToken(login, password);
    if (token == null) {
      await logout();
      return null;
    }
    _jwt = token;
    var user = await ApiUser.getUserByLogin(login);
    if (user == null) {
      _setState(SecurityState.loggedout, null);
      return null;
    }
    _account = SecurityAccount(login, password);
    if (persist) await _saveAccount();
    _setState(SecurityState.loggedin, user);
    return user;
  }

  Future<void> logout() async {
    _jwt = null;
    _account = null;
    await _saveAccount();
    _setState(SecurityState.loggedout, null);
  }

  void clearJWT() {
    _jwt = null;
  }

  void _setState(SecurityState newstate, UserAccount? user) {
    if (_state == newstate && _currentUser == user) return;
    if (_state != newstate) {
      _state = newstate;
      _stateUpdateController.add(newstate);
    }
    if (_currentUser != user) {
      _currentUser = user;
      _userUpdateController.add(user);
    }
  }

  Future<void> _saveAccount() async {
    await _storage.write(key: 'login', value: _account?.login);
    await _storage.write(key: 'password', value: _account?.password);
  }
}
