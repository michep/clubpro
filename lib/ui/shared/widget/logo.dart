import 'package:flutter/material.dart';

class ClubProLogo extends StatelessWidget {
  const ClubProLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
