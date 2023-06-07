import 'package:clubpro/models/user_account/admin_user_account.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/shared/widget/image_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUserAccountProfile extends StatelessWidget {
  final AdminUserAccount profile;

  const AdminUserAccountProfile({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('ADMIN PROFILE'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageField(
                fileset: profile.avatar,
                type: ImageFieldType.single,
                dimention: 250,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: saveProfile,
              child: const Text('Сохранить'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextButton(
              onPressed: back,
              child: const Text('BACK'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveProfile() async {
    await profile.save();
    await Get.find<SecurityService>().updateCurrentUser();
    Get.back(result: true, id: 1);
  }

  Future<void> back() async {
    Get.back(id: 1);
  }
}
