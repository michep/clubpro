import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/loginpage/pages/login_page.dart';
import 'package:clubpro/ui/register/pages/smscode_registration_page.dart';
import 'package:clubpro/ui/shared/widget/desktop_wrapper_center.dart';
import 'package:clubpro/ui/shared/widget/logo.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';

class InitialRegistrationPage extends StatefulWidget {
  const InitialRegistrationPage({super.key});

  @override
  State<InitialRegistrationPage> createState() => InitialRegistrationPageState();
}

class InitialRegistrationPageState extends State<InitialRegistrationPage> {
  final TextEditingController logincont = TextEditingController(text: '+7');
  final TextEditingController passwordcont = TextEditingController();
  final TextEditingController password2cont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    logincont.dispose();
    passwordcont.dispose();
    password2cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      title: 'Регистрация пользователя',
      mobileWrapper: (child) => MobileWrapperFullWidth(child: child),
      tabletWrapper: (child) => TabletWrapperCenter(child: child),
      desktopWrapper: (child) => DesktopWrapperCenter(child: child),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ClubProLogo(),
            TextFormField(
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
              controller: passwordcont,
              obscureText: true,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              validator: (value) => Utils.validateNotEmpty(value, 'Пароль не может быть пустым'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: password2cont,
              obscureText: true,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Повторите пароль',
              ),
              validator: (value) => Utils.validateCompareValues(value, passwordcont.text, 'Пароли не совпадают'),
              textInputAction: TextInputAction.next,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: register,
                child: const Text('Зарегистрироваться'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: login,
                child: const Text('Выполнить вход'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    Get.offAll(() => const LoginPage());
  }

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      var user = UserAccount(
        login: Utils.normalizePhone(logincont.text),
        password: Utils.hashPassword(passwordcont.text),
      );
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
      var res = await user.sendSMSCode();
      if (res['error'] != null) {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Ошибка отправки кода подтверждения',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      Get.offAll(() => SMSCodeRegistrationPage(user: user));
    }
  }
}
