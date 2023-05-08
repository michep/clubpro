import 'package:clubpro/models/business_user_account.dart';
import 'package:clubpro/models/pro_user_account.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    return Scaffold(
      appBar: AppBar(),
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
        widget.isBusiness
            ? DropdownButtonFormField<BusinessUserAccountType>(
                value: businessType,
                decoration: const InputDecoration(
                  labelText: 'Тип бизнеса',
                ),
                items: BusinessUserAccountType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  businessType = v;
                },
              )
            : DropdownButtonFormField<ProUserAccountType>(
                value: proType,
                decoration: const InputDecoration(
                  labelText: 'Вид деятельности',
                ),
                items: ProUserAccountType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
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
              'publicID': 'publicID',
              'login': widget.user.login,
              'email': _emailcont.text,
              'firstName': _firstNamecont.text,
              'lastName': _lastNamecont.text,
              'middleName': _middleNamecont.text,
              'password': widget.user.password,
              'proType': proType,
            });
      var reg = await newUser.registerConmtinue();
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
        newUser.login,
        newUser.password,
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
