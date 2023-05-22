import 'dart:async';
import 'dart:ui';
import 'package:clubpro/ui/adminhomepage/pages/admin_home_page.dart';
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
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void dispatch(SecurityState? state) {
    switch (state) {
      case SecurityState.loggedout:
        Get.offAll(() => const LoginPage());
        break;
      case SecurityState.loggedin:
        Get.offAll(() => const AdminHomePage());
        break;
      default:
        break;
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
