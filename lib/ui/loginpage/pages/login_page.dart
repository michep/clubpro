import 'package:clubpro/ui/loginpage/pages/phone_reset_password_page.dart';
import 'package:clubpro/ui/register/pages/initial_registration_page.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/shared/widget/desktop_wrapper_center.dart';
import 'package:clubpro/ui/shared/widget/logo.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:clubpro/service/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController logincont = TextEditingController(text: '+7');
  final TextEditingController passcont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    logincont.dispose();
    passcont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      title: 'Вход в приложение',
      mobileWrapper: (child) => MobileWrapperFullWidth(child: child),
      tabletWrapper: (child) => TabletWrapperCenter(child: child),
      desktopWrapper: (child) => DesktopWrapperCenter(child: child),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ClubProLogo(),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: logincont,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
                hintText: '+7 (999) 000 00 00',
              ),
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '+7 (###) ### ## ##',
                  filter: {'#': RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.eager,
                ),
              ],
              validator: (value) => Utils.validatePhone(value, 'Укажите номер телефона'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: passcont,
              obscureText: true,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              validator: (value) => Utils.validateNotEmpty(value, 'Укажите пароль для входа'),
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
                onPressed: reset,
                child: const Text('Забыл пароль'),
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
        ),
      ),
    );
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      var res = await Get.find<SecurityService>().login(
        Utils.normalizePhone(logincont.text),
        Utils.hashPassword(passcont.text),
      );
      if (res == null) {
        setState(() {
          // logincont.value = const TextEditingValue(text: '+7');
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
    Get.offAll(() => const InitialRegistrationPage());
  }

  Future<void> reset() async {
    Get.offAll(() => const PhonePasswordResetPage());
  }
}
