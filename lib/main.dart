import 'package:clubpro/clubpro_app.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/service/layout_service.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () async {
      var sec = SecurityService();
      sec.init();
      return sec;
    },
  );
  Get.put(LayoutService());
  Get.put(
    // DioService(baseUriFunc: (path) => Uri.https('api.clubpro.space', path)), //REAL DB
    DioService(baseUriFunc: (path) => Uri.http('127.0.0.1:8083', path)), //WEB Local DB
    // DioService(baseUriFunc: (path) => Uri.http('10.0.2.2:8083', path)), //Android Emulator Local DB
  );

  runApp(const ClubProApp());
}
