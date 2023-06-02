import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';

class ScaffoldDesktop extends StatelessWidget {
  final String title;
  final Widget child;
  final AppMenu? appMenu;

  const ScaffoldDesktop({
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
      body: SafeArea(
        child: Row(
          children: [
            if (appMenu != null)
              Material(
                elevation: 4,
                child: SizedBox(
                  width: 320,
                  child: appMenu != null ? appMenu!.renderColumn() : const SizedBox.shrink(),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  alignment: Alignment.center,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
