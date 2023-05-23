import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/service/subnavigator_service.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_edit.dart';
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
  final _subnav = Get.find<SubNavigatorService>();
  Widget? image;

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      appMenu: AppMenu(
        userProfile: () => _subnav.pushFirst(
          SubNavigatorValue<CatalogFolder?>(
            page: AppPages.adminprofile,
          ),
        ),
        user: _sec.currentUser!,
        items: [
          AppMenuItem(
            title: const Text('Каталог'),
            icon: Icons.folder,
            action: () => _subnav.pushFirst(
              SubNavigatorValue<CatalogFolder?>(
                page: AppPages.admincatalog,
                forceRefresh: true,
              ),
            ),
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
      child: StreamBuilder<SubNavigatorValue?>(
        stream: _subnav.subnavStream,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _selectPage(snapshot.data),
          );
        },
      ),
    );
  }

  Widget _selectPage(SubNavigatorValue? subnav) {
    switch (subnav?.page) {
      case AppPages.admincatalog:
        return CatalogFoldersList(forceRefresh: subnav!.forceRefresh);
      case AppPages.adminaddcatalogfolder:
        return const CatalogFolderEdit();
      case AppPages.admineditcatalogfolder:
        return const CatalogFolderEdit();
      case AppPages.adminprofile:
        return const AdminProfile();
      default:
        return const SizedBox.shrink();
    }
  }

  void logout() async {
    await _sec.logout();
  }
}
