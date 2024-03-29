import 'package:flutter/material.dart';

class TabletWrapperCenter extends StatelessWidget {
  final Widget child;
  final double width;

  const TabletWrapperCenter({
    this.width = 400,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            child: child,
          ),
        ],
      ),
    );
  }
}
