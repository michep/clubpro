import 'package:clubpro/page/initial_registration_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController logincont = TextEditingController();
  final TextEditingController passcont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ClubProLogo(),
        TextFormField(
          controller: logincont,
          decoration: const InputDecoration(
            labelText: 'Имя пользователя',
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'Укажите имя пользователя' : null,
          textInputAction: TextInputAction.next,
        ),
        TextFormField(
          controller: passcont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Пароль',
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'Укажите пароль для входа' : null,
          onEditingComplete: login,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: login,
            child: const Text('Войти'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextButton(
            onPressed: register,
            child: const Text('Зарегистрироваться'),
          ),
        ),
      ],
    );
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      var res = await Get.find<SecurityService>().login(logincont.text, SecurityService.hashPassword(passcont.text));
      if (res == null) {
        setState(() {
          logincont.value = TextEditingValue.empty;
          passcont.value = TextEditingValue.empty;
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Ошибка входа в приложение',
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        });
      }
    }
  }

  Future<void> register() async {
    Get.to(() => const InitialRegistrationPage());
  }
}
