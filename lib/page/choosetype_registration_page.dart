import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/page/business_registration_page.dart';
import 'package:clubpro/page/pro_registration_page.dart';
import 'package:clubpro/page/type_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChooseTypeRegistrationPage extends StatelessWidget {
  final UserAccount user;
  const ChooseTypeRegistrationPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return mobileWrapper(content());
            }
            return tabletWrapper(content());
          },
        ),
      ),
    );
  }

  Widget mobileWrapper(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: content(),
    );
  }

  Widget tabletWrapper(Widget child) {
    return Center(
      child: SizedBox(
        width: 400,
        child: child,
      ),
    );
  }

  Widget content() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: business,
          child: Text('БИЗНЕС'),
        ),
        const SizedBox(width: 20,),
        ElevatedButton(
          onPressed: pro,
          child: Text('ПРОФЕССИОНАЛ'),
        ),
      ],
    );
  }

  Future<void> business() async {
    // Get.to(() => BusinessRegistrationPage(user: user,));
    Get.to(() => TypeRegistrationPage(user: user, isBusiness: true,));
  }

  Future<void> pro() async {
    // Get.to(() => ProRegistrationPage(user: user,));
    Get.to(() => TypeRegistrationPage(user: user, isBusiness: false,));
  }
}
