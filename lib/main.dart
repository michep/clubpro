import 'package:clubpro/api/api_auth.dart';
import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/clubpro_app.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sec = SecurityService();
  await sec.init();
  Get.put(sec);
  var dio = DioService(baseUriFunc: (path) => Uri.http('127.0.0.1:8083', path));
  dio.init();
  Get.put(dio);

  var r = await ApiAuth.authenticate(login: 'test', password: sec.hashPassword('password'));
  await Future.delayed(Duration(seconds: 15));
  var user = ApiUser.getUserByLogin('test');

  runApp(ClubProApp());
}
