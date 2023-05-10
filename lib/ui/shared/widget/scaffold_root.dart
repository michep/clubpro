import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScaffoldRoot extends StatelessWidget {
  final Widget Function(Widget)? mobileWrapper;
  final Widget Function(Widget)? tabletWrapper;
  final Widget Function(Widget)? desktopWrapper;
  final Widget child;

  const ScaffoldRoot({
    required this.child,
    this.mobileWrapper,
    this.tabletWrapper,
    this.desktopWrapper,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isDesktop) {
              return desktopWrapper != null
                  ? desktopWrapper!(child)
                  : tabletWrapper != null
                      ? tabletWrapper!(child)
                      : mobileWrapper != null
                          ? mobileWrapper!(child)
                          : child;
            } else if (sizingInformation.isTablet) {
              return tabletWrapper != null
                  ? tabletWrapper!(child)
                  : mobileWrapper != null
                      ? mobileWrapper!(child)
                      : child;
            }
            return mobileWrapper != null ? mobileWrapper!(child) : child;
          },
        ),
      ),
    );
  }
}
