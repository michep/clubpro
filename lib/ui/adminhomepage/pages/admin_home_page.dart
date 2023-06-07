import 'package:clubpro/models/user_account/admin_user_account.dart';
import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/adminhomepage/widgets/admin_profile.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folders_grid.dart';
import 'package:clubpro/ui/adminhomepage/widgets/users_list.dart';
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
          userProfile: () => Get.to(() => AdminUserAccountProfile(profile: _sec.currentUser! as AdminUserAccount), id: 1),
          user: _sec.currentUser!,
          items: [
            AppMenuItem(
              title: const Text('Каталог'),
              icon: Icons.folder,
              action: () => Get.to(() => const CatalogFoldersGrid(), id: 1),
            ),
            AppMenuItem(
              title: const Text('Пользователи'),
              icon: Icons.person_3,
              action: () => Get.to(() => const UsersList(), id: 1),
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
