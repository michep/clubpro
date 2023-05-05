import 'dart:async';
import 'dart:convert';
import 'package:clubpro/api/api_auth.dart';
import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
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
  SecurityState _state = SecurityState.loggedout;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BehaviorSubject<SecurityState> _stateUpdateController = BehaviorSubject();
  late final Stream<SecurityState> stream;

  SecurityService() {
    stream = _stateUpdateController.stream;
    _stateUpdateController.add(SecurityState.loggedout);
  }

  String? get jwt => _jwt;
  SecurityAccount? get account => _account;
  UserAccount? get currentUser => _currentUser;

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
      _setState(SecurityState.loggedout);
      return null;
    }
    _jwt = token;
    var user = await ApiUser.getUserByLogin(login);
    if (user == null) {
      _setState(SecurityState.loggedout);
      return null;
    }
    _account = SecurityAccount(login, password);
    if (persist) await _saveAccount();
    _setState(SecurityState.loggedin);
    _currentUser = user;
    return user;
  }

  Future<void> logout() async {
    _jwt = null;
    _account = null;
    await _saveAccount();
    _setState(SecurityState.loggedout);
  }

  void clearJWT() {
    _jwt = null;
  }

  void _setState(SecurityState newstate) {
    if (_state == newstate) return;
    _state = newstate;
    _stateUpdateController.add(newstate);
  }

  Future<void> _saveAccount() async {
    await _storage.write(key: 'login', value: _account?.login);
    await _storage.write(key: 'password', value: _account?.password);
  }

  static String hashPassword(String password) {
    var bin = utf8.encode(password);
    return sha256.convert(bin).toString();
  }
}
