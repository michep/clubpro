import 'package:clubpro/page/business_registration_page.dart';
import 'package:clubpro/page/pro_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChooseTypeRegistrationPage extends StatelessWidget {
  const ChooseTypeRegistrationPage({super.key});

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
        ElevatedButton(
          onPressed: pro,
          child: Text('ПРОФЕССИОНАЛ'),
        ),
      ],
    );
  }

  Future<void> business() async {
    Get.offAll(() => const BusinessRegistrationPage());
  }

  Future<void> pro() async {
    Get.offAll(() => const ProRegistrationPage());
  }
}
