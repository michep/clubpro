import 'package:clubpro/models/business_user_account.dart';
import 'package:clubpro/models/pro_user_account.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/shared/widget/mobile_wrapper_full_width.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:clubpro/ui/shared/widget/tablet_wrapper_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeRegistrationPage extends StatefulWidget {
  final UserAccount user;
  final bool isBusiness;
  const TypeRegistrationPage({required this.user, required this.isBusiness, super.key});

  @override
  State<TypeRegistrationPage> createState() => _TypeRegistrationPageState();
}

class _TypeRegistrationPageState extends State<TypeRegistrationPage> {
  final _sec = Get.find<SecurityService>();
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _firstNamecont = TextEditingController();
  final TextEditingController _lastNamecont = TextEditingController();
  final TextEditingController _middleNamecont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  ProUserAccountType? proType;
  BusinessUserAccountType? businessType;

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
            TextFormField(
              controller: _emailcont,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
              ),
              validator: (value) => Utils.validateNotEmpty(value, 'Укажите электронную почту'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _lastNamecont,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Фамилия',
              ),
              validator: (value) => Utils.validateNotEmpty(value, 'Укажите фамилию'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _firstNamecont,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Имя',
              ),
              validator: (value) => Utils.validateNotEmpty(value, 'Укажите имя'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _middleNamecont,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Отчество',
              ),
              textInputAction: TextInputAction.next,
            ),
            widget.isBusiness
                ? DropdownButtonFormField<BusinessUserAccountType>(
                    value: businessType,
                    decoration: const InputDecoration(
                      labelText: 'Тип бизнеса',
                    ),
                    items: BusinessUserAccountType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                    onChanged: (v) {
                      businessType = v;
                    },
                  )
                : DropdownButtonFormField<ProUserAccountType>(
                    value: proType,
                    decoration: const InputDecoration(
                      labelText: 'Вид деятельности',
                    ),
                    items: ProUserAccountType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                    onChanged: (v) {
                      proType = v;
                    },
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: registerFinally,
                child: const Text('Зарегистрироваться'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerFinally() async {
    if (formKey.currentState!.validate()) {
      var newUser = widget.isBusiness
          ? BusinessUserAccount.fromMap({
              '_id': widget.user.id,
              'login': widget.user.login,
              'email': _emailcont.text,
              'firstName': _firstNamecont.text,
              'lastName': _lastNamecont.text,
              'middleName': _middleNamecont.text,
              'password': widget.user.password,
              'businessType': businessType,
            })
          : ProUserAccount.fromMap({
              '_id': widget.user.id,
              'login': widget.user.login,
              'email': _emailcont.text,
              'firstName': _firstNamecont.text,
              'lastName': _lastNamecont.text,
              'middleName': _middleNamecont.text,
              'password': widget.user.password,
              'proType': proType,
            });
      var reg = await newUser.registerContinue();
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
      var res = await _sec.login(
        newUser.login!,
        newUser.password!,
      );
      if (res == null) {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Ошибка входа в приложение',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
