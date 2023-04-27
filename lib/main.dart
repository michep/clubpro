import 'dart:typed_data';

import 'package:clubpro/models/pro_user_account.dart';
import 'package:flutter/material.dart';
import 'clubpro_app.dart';

void main() {
  var b = ProUserAccount(
    id: 'id',
    login: 'login',
    password: 'password',
    phone: 'phone',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    avatar: Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9]),
    proType: ProUserAccountType.architect,
    publicID: '12312123',
  );
  b.save();
  runApp(const ClubProApp());
}
