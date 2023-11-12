import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nge/components/nav.dart';
import 'package:nge/pages/homepage.dart';
import 'package:nge/theme.dart';

class DrawerNavbar extends StatefulWidget {
  const DrawerNavbar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerNavbarState createState() => _DrawerNavbarState();
}

class _DrawerNavbarState extends State<DrawerNavbar> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const Nav(),
      mainScreen: const HomePage(),
      borderRadius: 24.0,
      showShadow: true,
      menuBackgroundColor: darkColor,
      // drawerShadowsBackgroundColor: subtitleColor,
      slideWidth: MediaQuery.of(context).size.width * .60,
      isRtl: true,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      style: DrawerStyle.defaultStyle,
    );
  }
}
