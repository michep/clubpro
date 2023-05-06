import 'package:clubpro/models/user_account.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProRegistrationPage extends StatelessWidget {
  final UserAccount user;
  ProRegistrationPage({required this.user, super.key});

  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _firstNamecont = TextEditingController();
  final TextEditingController _lastNamecont = TextEditingController();
  final TextEditingController _middleNamecont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Зарегистрироваться'),
          ),
        ),
      ],
    );
  }
}
