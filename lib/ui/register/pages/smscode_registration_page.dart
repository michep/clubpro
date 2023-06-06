import 'dart:async';

import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/ui/register/pages/choosetype_registration_page.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final TextEditingController codecont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  int counter = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    codecont.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      title: 'Регистрация пользователя',
      mobileWrapper: (child) => MobileWrapperFullWidth(child: child),
      tabletWrapper: (child) => TabletWrapperCenter(child: child),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                onPressed: checkcode,
                child: const Text('Проверить код'),
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

  Future<void> checkcode() async {
    var res = await widget.user.checkSMSCode(codecont.text);
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

    Get.offAll(() => ChooseTypeRegistrationPage(
          user: widget.user,
        ));
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
