import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _sec = Get.find<SecurityService>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(_sec.currentUser!.firstName),
            ElevatedButton(
              onPressed: logout,
              child: const Text('Выйти из приложения'),
            ),
          ],
        ),
      ),
    );
  }

  void logout() async {
    await _sec.logout();
  }
}
