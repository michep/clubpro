import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/ui/register/pages/type_registration_page.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseTypeRegistrationPage extends StatelessWidget {
  final UserAccount user;
  const ChooseTypeRegistrationPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      mobileWrapper: (child) => MobileWrapperFullWidth(child: child),
      tabletWrapper: (child) => TabletWrapperCenter(child: child),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: business,
            child: const Text('БИЗНЕС'),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: pro,
            child: const Text('ПРОФЕССИОНАЛ'),
          ),
        ],
      ),
    );
  }

  Future<void> business() async {
    Get.to(() => TypeRegistrationPage(
          user: user,
          isBusiness: true,
        ));
  }

  Future<void> pro() async {
    Get.to(() => TypeRegistrationPage(
          user: user,
          isBusiness: false,
        ));
  }
}
