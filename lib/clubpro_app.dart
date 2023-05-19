import 'dart:async';
import 'dart:ui';
import 'package:clubpro/ui/homepage/pages/home_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/loginpage/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubProApp extends StatefulWidget {
  const ClubProApp({super.key});

  @override
  State<ClubProApp> createState() => _ClubProAppState();
}

class _ClubProAppState extends State<ClubProApp> {
  final _sec = Get.find<SecurityService>();
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _sub = _sec.securityStateStream.listen(dispatch);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Club PRO',
      scrollBehavior: AppScrollBehavior(),
      home: const Scaffold(
        body: CircularProgressIndicator(),
      ),
    );
  }

  void dispatch(SecurityState state) {
    if (state == SecurityState.loggedout) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
