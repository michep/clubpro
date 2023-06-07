import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/loginpage/pages/smscode_reset_password_page.dart';
import 'package:clubpro/ui/shared/widget/desktop_wrapper_center.dart';
import 'package:clubpro/ui/shared/widget/logo.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:clubpro/ui/loginpage/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';

class PhonePasswordResetPage extends StatefulWidget {
  const PhonePasswordResetPage({super.key});

  @override
  State<PhonePasswordResetPage> createState() => PhonePasswordResetPageState();
}

class PhonePasswordResetPageState extends State<PhonePasswordResetPage> {
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
      title: 'Сбросить пароль',
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
              onEditingComplete: next,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: next,
                child: const Text('Прислать код'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: login,
                child: const Text('Вернуться для входа в приложение'),
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

  Future<void> next() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      var user = UserAccount(
        login: Utils.normalizePhone(logincont.text),
      );

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

      Get.offAll(() => SMSCodePasswordResetPage(user: user));
    }
  }
}
