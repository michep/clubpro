import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:clubpro/ui/shared/widget/scaffold_desktop.dart';
import 'package:clubpro/ui/shared/widget/scaffold_mobile.dart';
import 'package:clubpro/ui/shared/widget/scaffold_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScaffoldRoot extends StatelessWidget {
  final Widget Function(Widget)? mobileWrapper;
  final Widget Function(Widget)? tabletWrapper;
  final Widget Function(Widget)? desktopWrapper;
  final Widget child;
  late final String title;
  final AppMenu? appMenu;

  ScaffoldRoot({
    required this.child,
    this.mobileWrapper,
    this.tabletWrapper,
    this.desktopWrapper,
    this.appMenu,
    String? title,
    super.key,
  }) {
    if (title == null) {
      this.title = 'ClubPRO';
    } else {
      this.title = 'ClubPRO - $title';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return ScaffoldDesktop(
            title: title,
            appMenu: appMenu,
            child: child,
          );
        } else if (sizingInformation.isTablet) {
          return ScaffoldTablet(
            title: title,
            appMenu: appMenu,
            child: child,
          );
        }
        return ScaffoldMobile(
          title: title,
          appMenu: appMenu,
          child: child,
        );
      },
    );
  }
}
