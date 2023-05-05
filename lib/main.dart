import 'package:clubpro/clubpro_app.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sec = SecurityService();
  Get.put(sec);
  var dio = DioService(baseUriFunc: (path) => Uri.http('127.0.0.1:8083', path)); //WEB
  // var dio = DioService(baseUriFunc: (path) => Uri.http('10.0.2.2:8083', path)); //Android Emulator
  dio.init();
  Get.put(dio);
  await sec.init();

  runApp(ClubProApp());
}
