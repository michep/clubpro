import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';

class ScaffoldMobile extends StatelessWidget {
  final String title;
  final Widget child;
  final AppMenu? appMenu;

  const ScaffoldMobile({
    required this.title,
    required this.child,
    this.appMenu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: appMenu != null
          ? SafeArea(
              child: Drawer(
                child: appMenu!.renderColumn(),
              ),
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
