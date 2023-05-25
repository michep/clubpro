import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/adminhomepage/widgets/admin_profile.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folders_list.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final _sec = Get.find<SecurityService>();
  Widget? image;

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      appMenu: AppMenu(
        userProfile: () => Get.to(() => const AdminProfile(), id: 1),
        user: _sec.currentUser!,
        items: [
          AppMenuItem(
            title: const Text('Каталог'),
            icon: Icons.folder,
            action: () => Get.offAll(() => const CatalogFoldersList(), id: 1),
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
    );
  }

  void logout() async {
    await _sec.logout();
  }
}
