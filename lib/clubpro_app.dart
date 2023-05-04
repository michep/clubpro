import 'dart:ui';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubProApp extends StatelessWidget {
  final _sec = Get.find<SecurityService>();
  ClubProApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: StreamBuilder<SecurityState>(
        stream: _sec.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          }
          return Text(snapshot.data!.name);
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
