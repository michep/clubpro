import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/businesshomepage/widgets/business_profile.dart';
import 'package:clubpro/ui/businesshomepage/widgets/products_list.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessHomePage extends StatefulWidget {
  const BusinessHomePage({super.key});

  @override
  State<BusinessHomePage> createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
  final _sec = Get.find<SecurityService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Get.global(1).currentState?.canPop() == true) {
          Get.global(1).currentState?.pop();
          return false;
        }
        return true;
      },
      child: ScaffoldRoot(
        appMenu: AppMenu(
          userProfile: () => Get.to(() => const BusinessProfile(), id: 1),
          user: _sec.currentUser!,
          items: [
            AppMenuItem(
              title: const Text('Продукты'),
              icon: Icons.folder,
              action: () => Get.to(() => const ProductsList(), id: 1),
            ),
          ],
          bottomItems: [
            AppMenuItem(
              title: const Text('Выход'),
              icon: Icons.logout,
              action: logout,
            )
          ],
        ),
        child: Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (settings) {
            return GetPageRoute(page: () => const SizedBox.shrink());
          },
        ),
      ),
    );
  }

  void logout() async {
    await _sec.logout();
  }
}
