import 'dart:async';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/ui/loginpage/pages/login_page.dart';
import 'package:clubpro/ui/shared/widget/logo.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SMSCodePasswordResetPage extends StatefulWidget {
  final UserAccount user;

  const SMSCodePasswordResetPage({
    required this.user,
    super.key,
  });

  @override
  State<SMSCodePasswordResetPage> createState() => SMSCodePasswordResetPageState();
}

class SMSCodePasswordResetPageState extends State<SMSCodePasswordResetPage> {
  final TextEditingController codecont = TextEditingController();
  final TextEditingController passwordcont = TextEditingController();
  final TextEditingController password2cont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  int counter = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      mobileWrapper: (child) => MobileWrapperFullWidth(child: child),
      tabletWrapper: (child) => TabletWrapperCenter(child: child),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ClubProLogo(),
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
            TextFormField(
              controller: codecont,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'СМС код',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: resetpassword,
                child: const Text('Сменить пароль'),
              ),
            ),
            counter == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: resendSMSCode,
                      child: const Text('Прислать код еще раз'),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text('Повтор кода через $counter секунд'),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> resetpassword() async {
    var user = widget.user.copyWith(password: SecurityService.hashPassword(passwordcont.text));
    var res = await user.resetPassword(codecont.text);
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
    Get.offAll(() => const LoginPage());
  }

  Future<void> resendSMSCode() async {
    await widget.user.sendSMSCode();
    startTimer();
  }

  void startTimer() {
    counter = 10;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTimer,
    );
  }

  void onTimer(Timer timer) {
    if (counter == 0) {
      setState(() {
        timer.cancel();
      });
    } else {
      setState(() {
        counter--;
      });
    }
  }
}
