import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/ui/register/pages/smscode_registration_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/shared/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InitialRegistrationPage extends StatefulWidget {
  const InitialRegistrationPage({super.key});

  @override
  State<InitialRegistrationPage> createState() => InitialRegistrationPageState();
}

class InitialRegistrationPageState extends State<InitialRegistrationPage> {
  final TextEditingController _logincont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();
  final TextEditingController _password2cont = TextEditingController();
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
        const ClubProLogo(),
        TextFormField(
          controller: _logincont,
          decoration: const InputDecoration(
            labelText: 'Номер телефона',
          ),
        ),
        TextFormField(
          controller: _passwordcont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Пароль',
          ),
        ),
        TextFormField(
          controller: _password2cont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Повторите пароль',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: register,
            child: const Text('Зарегистрироваться'),
          ),
        ),
      ],
    );
  }

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      var user = UserAccount.fromMap({
        'login': _logincont.text,
        'email': '',
        'firstName': '',
        'lastName': '',
        'middleName': '',
        'password': SecurityService.hashPassword(_passwordcont.text),
      });
      var reg = await user.register();
      if (reg['error'] != null) {
        Get.showSnackbar(
          GetSnackBar(
            message: reg['error'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      user = user.copyWith(id: reg['inserted_id']);
      await user.sendSMSCode();
      Get.offAll(() => SMSCodeRegistrationPage(user: user));
    }
  }
}
