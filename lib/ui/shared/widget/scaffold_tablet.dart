import 'package:clubpro/models/app_menu.dart';
import 'package:flutter/material.dart';

class ScaffoldTablet extends StatelessWidget {
  final String title;
  final Widget child;
  final AppMenu? appMenu;

  const ScaffoldTablet({
    super.key,
    required this.title,
    required this.child,
    this.appMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: appMenu != null
          ? Drawer(
              child: appMenu!.renderColumn(),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
