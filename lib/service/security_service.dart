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
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BehaviorSubject<SecurityState?> _stateUpdateController = BehaviorSubject();

  SecurityService() {
    _stateUpdateController.add(null);
  }

  String? get jwt => _jwt;
  SecurityAccount? get account => _account;
  UserAccount? get currentUser => _currentUser;
  SecurityState? get currentState => _stateUpdateController.value;
  Stream<SecurityState?> get securityStateStream => _stateUpdateController.stream;

  void setCurrentUser(UserAccount? user) {
    _setState(_stateUpdateController.value, user);
  }

  Future<void> init() async {
    var login = await _storage.read(key: 'login');
    var password = await _storage.read(key: 'password');
    if (login != null && password != null) {
      await this.login(login, password, persist: false);
    } else {
      await logout();
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

  void _setState(SecurityState? newstate, UserAccount? user) {
    if (currentState == newstate && currentUser == user) return;
    if (currentState != newstate) {
      _stateUpdateController.add(newstate);
    }
    if (currentUser != user) {
      _currentUser = user;
    }
  }

  Future<void> _saveAccount() async {
    await _storage.write(key: 'login', value: _account?.login);
    await _storage.write(key: 'password', value: _account?.password);
  }
}
