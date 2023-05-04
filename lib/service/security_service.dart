import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';

enum SecurityState { loggedout, loggedin }

class SecurityService {
  String? jwt;
  String? login;
  String? password;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final StreamController<SecurityState> _stateUpdateController = StreamController.broadcast();
  late final Stream<SecurityState> stream;

  SecurityService() {
    stream = _stateUpdateController.stream;
  }

  Future<void> init() async {
    jwt = await _storage.read(key: 'jwt');
    login = await _storage.read(key: 'login');
    password = await _storage.read(key: 'password');
    if (login != null && password != null) {
      _stateUpdateController.add(SecurityState.loggedin);
    } else {
      _stateUpdateController.add(SecurityState.loggedout);
    }
  }

  Future<void> saveCredentials(String login, String password) async {
    this.login = login;
    this.password = password;
    await _storage.write(key: 'login', value: login);
    await _storage.write(key: 'password', value: password);
    _stateUpdateController.add(SecurityState.loggedin);
  }

  String hashPassword(String password) {
    var bin = utf8.encode(password);
    return sha256.convert(bin).toString();
  }
}
