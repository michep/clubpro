import 'package:clubpro/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _logincont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
            labelText: 'Имя пользователя',
          ),
        ),
        TextFormField(
          controller: _passcont,
          obscureText: true,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Пароль',
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Войти'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
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
