import 'dart:typed_data';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef VoidFunction = void Function();

class AppMenu {
  final UserAccount? user;
  final VoidFunction? userProfile;
  final List<AppMenuItem> items;
  final List<AppMenuItem>? bottomItems;
  final _sec = Get.find<SecurityService>();

  AppMenu({
    required this.items,
    this.user,
    this.userProfile,
    this.bottomItems,
  });

  Widget renderColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user != null) renderHeader(user!),
        ...items.map(
          (e) => ListTile(
            leading: Icon(e.icon),
            title: e.title,
            onTap: () {
              Get.back();
              if (e.action != null) e.action!();
            },
          ),
        ),
        const Spacer(),
        if (bottomItems != null)
          ...bottomItems!.map(
            (e) => ListTile(
              leading: Icon(e.icon),
              title: e.title,
              onTap: () {
                Get.back();
                if (e.action != null) e.action!();
              },
            ),
          ),
      ],
    );
  }

  Widget renderHeader(UserAccount user) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 100,
          color: Colors.blue,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Uint8List?>(
            future: _sec.currentUser!.avatar(),
            builder: (context, snapshot) {
              return CircleAvatar(
                radius: 40,
                backgroundImage: snapshot.hasData ? Image.memory(snapshot.data!).image : null,
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    user.fullname,
                  ),
                ),
                if (userProfile != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          userProfile!();
                        },
                        child: const Icon(Icons.settings_outlined),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppMenuItem {
  final Widget title;
  final IconData icon;
  final VoidFunction? action;

  AppMenuItem({
    required this.title,
    required this.icon,
    this.action,
  });
}
