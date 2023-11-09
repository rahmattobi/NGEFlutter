import 'package:flutter/material.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/navbar_wh.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image.asset(
                  'assets/images/natuna2.png',
                  width: 220,
                ),
              ),
              const Spacer(),
              const Row(
                children: [
                  NavbarTitleWidget(title: 'HOME', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'ABOUT', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'PRODUCTS', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'CLIENTS', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'CASE STUDIES', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'CONTACT', url: ''),
                  SizedBox(
                    width: 20,
                  ),
                  NavbarTitleWidget(title: 'BLOG', url: ''),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  AppTheme.customTextButton(
                    text: 'INQUIRY',
                    onPressed: () {},
                    iconData: Icons.list_alt_rounded,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AppTheme.customTextButton(
                    text: 'HELP DESK : +62 2150886205',
                    onPressed: () {},
                    iconData: Icons.phone_sharp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
