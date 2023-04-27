import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubProApp extends StatelessWidget {
  const ClubProApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: const Placeholder(),
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
