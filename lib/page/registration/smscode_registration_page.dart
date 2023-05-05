import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/page/registration/choosetype_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SMSCodeRegistrationPage extends StatefulWidget {
  final UserAccount user;

  const SMSCodeRegistrationPage({
    required this.user,
    super.key,
  });

  @override
  State<SMSCodeRegistrationPage> createState() => SMSCodelRegistrationPageState();
}

class SMSCodelRegistrationPageState extends State<SMSCodeRegistrationPage> {
  final TextEditingController _codecont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return mobileWrapper(content());
              }
              return tabletWrapper(content());
            },
          ),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: _codecont,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'СМС код',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: checkcode,
            child: const Text('Проверить код'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: resend,
            child: const Text('Прислать код еще раз'),
          ),
        ),
      ],
    );
  }

  Future<void> checkcode() async {
    var res = await widget.user.checkSMSCode(_codecont.text);
    if (res['result'] != 'ok') {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Неверный код подтверждения',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    Get.offAll(() => const ChooseTypeRegistrationPage());
  }

  Future<void> resend() async {
    widget.user.sendSMSCode();
  }
}
