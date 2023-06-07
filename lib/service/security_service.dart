import 'package:clubpro/api/api_auth.dart';
import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class SecurityAccount {
  final String login;
  final String password;

  SecurityAccount(this.login, this.password);
}

class SecurityService {
  String? _jwt;
  SecurityAccount? _currentAccount;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BehaviorSubject<UserAccount?> _userUpdateController = BehaviorSubject();

  SecurityService() {
    _userUpdateController.add(null);
  }

  String? get jwt => _jwt;
  SecurityAccount? get currentAccount => _currentAccount;
  UserAccount? get currentUser => _userUpdateController.value;
  Stream<UserAccount?> get securityStateStream => _userUpdateController.stream;

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
      _setState(null);
      return null;
    }
    _currentAccount = SecurityAccount(login, password);
    if (persist) await _saveAccount();
    _setState(user);
    return user;
  }

  Future<void> logout() async {
    _jwt = null;
    _currentAccount = null;
    await _saveAccount();
    _setState(UserAccount(id: ''));
  }

  void clearJWT() {
    _jwt = null;
  }

  Future<void> updateCurrentUser() async {
    var user = await ApiUser.getUserByLogin(currentUser!.login!);
    _userUpdateController.add(user);
  }

  void _setState(UserAccount? user) {
    if (currentUser != user) {
      _userUpdateController.add(user);
    }
  }

  Future<void> _saveAccount() async {
    await _storage.write(key: 'login', value: _currentAccount?.login);
    await _storage.write(key: 'password', value: _currentAccount?.password);
  }
}
