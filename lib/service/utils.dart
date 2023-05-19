import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static String hashPassword(String password) {
    var bin = utf8.encode(password);
    return sha256.convert(bin).toString();
  }

  static String normalizePhone(String phone) {
    return phone.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll('+', '');
  }

  static String? validateNotEmpty(String? value, String message) {
    return (value == null || value.isEmpty) ? message : null;
  }

  static String? validatePhone(String? value, String message) {
    return (value == null || value.isEmpty || value.length != 18) ? message : null;
  }

  static String? validateEmail(String? value, String message) {
    var re = RegExp(r'.+@.+\..+');
    return (value == null || value.isEmpty || !re.hasMatch(value)) ? message : null;
  }

  static String? validateCompareValues(String? value1, String? value2, String message) {
    return (value1 == null || value1.isEmpty || value2 == null || value2.isEmpty || value1 != value2) ? message : null;
  }
}
