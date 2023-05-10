import 'package:flutter/material.dart';

class MobileWrapperFullWidth extends StatelessWidget {
  final Widget child;

  const MobileWrapperFullWidth({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: child,
    );
    ;
  }
}
