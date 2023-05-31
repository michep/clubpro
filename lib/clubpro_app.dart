import 'dart:async';
import 'dart:ui';
import 'package:clubpro/models/user_account/admin_user_account.dart';
import 'package:clubpro/models/user_account/business_user_account.dart';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/ui/adminhomepage/pages/admin_home_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/businesshomepage/pages/business_home_page.dart';
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
      transitionDuration: const Duration(milliseconds: 0),
      title: 'Club PRO',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void dispatch(UserAccount? user) {
    if (user is UserAccount && user.id == '') Get.offAll(() => const LoginPage());
    if (user is AdminUserAccount) Get.offAll(() => const AdminHomePage());
    if (user is BusinessUserAccount) Get.offAll(() => const BusinessHomePage());
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
