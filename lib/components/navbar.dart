import 'package:flutter/material.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/navbar_wh.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isHovered = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logoNav(size),
          const Spacer(),
          const SizedBox(
            width: 20,
          ),
          menuNav(),
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.phone_sharp,
              color: subtitleColor,
            ),
            label: Text(
              'INQUIRY',
              style: subtitleTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
                color: subtitleColor,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  MouseRegion logoNav(Size size) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Image.asset(
        'assets/images/natuna2.png',
        width: size.width < 500 ? 150 : 220,
      ),
    );
  }

  Row menuNav() {
    return const Row(
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
    );
  }

  onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  onHover2(bool isHovered) {
    setState(() {
      isHovered2 = isHovered;
    });
  }

  onHover3(bool isHovered) {
    setState(() {
      isHovered3 = isHovered;
    });
  }
}
