import 'package:flutter/material.dart';

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const HelperClass({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool mobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool desktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool ipadScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobile;
        } else if (constraints.maxWidth < 1200) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
