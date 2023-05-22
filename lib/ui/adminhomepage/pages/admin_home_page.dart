import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/service/admin_page_service.dart';
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
  final _adminpage = Get.find<AdminPageService>();
  Widget? image;

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      appMenu: AppMenu(
        userProfile: () => _adminpage.setAdminPage(AdminPages.profile),
        user: _sec.currentUser!,
        items: [
          AppMenuItem(
            title: const Text('Каталог'),
            icon: Icons.folder,
            action: () => _adminpage.setAdminPage(AdminPages.catalog),
          )
        ],
        bottomItems: [
          AppMenuItem(
            title: const Text('Выход'),
            icon: Icons.logout,
            action: logout,
          )
        ],
      ),
      child: StreamBuilder<AdminPages?>(
        stream: _adminpage.adminPagesStream,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _selectPage(snapshot.data),
          );
        },
      ),
    );
  }

  Widget _selectPage(AdminPages? page) {
    switch (page) {
      case AdminPages.catalog:
        return CatalogFoldersList();
      case AdminPages.profile:
        return const AdminProfile();
      default:
        return const SizedBox.shrink();
    }
  }

  void logout() async {
    await _sec.logout();
  }
}
