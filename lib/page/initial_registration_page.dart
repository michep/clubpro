import 'package:clubpro/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InitialRegistrationPage extends StatefulWidget {
  const InitialRegistrationPage({super.key});

  @override
  State<InitialRegistrationPage> createState() => InitialRegistrationPageState();
}

class InitialRegistrationPageState extends State<InitialRegistrationPage> {
  final TextEditingController _logincont = TextEditingController();
  final TextEditingController _phonecont = TextEditingController();
  final TextEditingController _passwordcont = TextEditingController();
  final TextEditingController _password2cont = TextEditingController();
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _firstNamecont = TextEditingController();
  final TextEditingController _lastNamecont = TextEditingController();
  final TextEditingController _middleNamecont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
    return SizedBox(
      width: 400,
      child: child,
    );
  }

  Widget content() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ClubProLogo(),
        TextFormField(
          controller: _logincont,
          decoration: const InputDecoration(
            labelText: 'Имя для входа',
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
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Электронная почта',
          ),
        ),
        TextFormField(
          controller: _phonecont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Номер телефона',
          ),
        ),
        TextFormField(
          controller: _lastNamecont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Фамилия',
          ),
        ),
        TextFormField(
          controller: _firstNamecont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Имя',
          ),
        ),
        TextFormField(
          controller: _middleNamecont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Отчество',
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Зарегистрироваться'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
