import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nge/theme.dart';

import '../widget/navbar_wh.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        ZoomDrawer.of(context)!.close();
      },
      child: Scaffold(
        backgroundColor: darkColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30,
              ),
              logoNav(size),
              const SizedBox(
                height: 30,
              ),
              menuNav(size),
            ],
          ),
        ),
      ),
    );
  }
}

MouseRegion logoNav(Size size) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Image.asset(
      'assets/images/natuna1.png',
      width: size.width < 500 ? 150 : 220,
    ),
  );
}

Column menuNav(Size size) {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      NavbarTitleWidget(title: 'HOME', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'ABOUT', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'PRODUCTS', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'CLIENTS', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'CASE STUDIES', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'CONTACT', url: ''),
      SizedBox(
        height: 30,
      ),
      NavbarTitleWidget(title: 'BLOG', url: ''),
    ],
  );
}
