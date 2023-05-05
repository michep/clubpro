import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/page/smscode_registration_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/widget/logo.dart';
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
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _firstNamecont = TextEditingController();
  final TextEditingController _lastNamecont = TextEditingController();
  final TextEditingController _middleNamecont = TextEditingController();
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
        TextFormField(
          controller: _emailcont,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Электронная почта',
          ),
        ),
        TextFormField(
          controller: _lastNamecont,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Фамилия',
          ),
        ),
        TextFormField(
          controller: _firstNamecont,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Имя',
          ),
        ),
        TextFormField(
          controller: _middleNamecont,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Отчество',
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
        'email': _emailcont.text,
        'firstName': _firstNamecont.text,
        'lastName': _lastNamecont.text,
        'middleName': _middleNamecont.text,
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
