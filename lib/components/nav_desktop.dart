import 'package:flutter/material.dart';
import '../components/menu_nav.dart';
import '../theme.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: logoNav(size),
          ),
          const Spacer(),
          const SizedBox(
            width: 20,
          ),
          const MenuNav(),
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/inquiry');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
                  // Memberikan efek shadow saat tombol di-hover
                  return states.contains(MaterialState.hovered) ? 8 : 0;
                },
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.line_style_outlined,
                  color: primaryColor,
                ), // Gantilah dengan ikon yang diinginkan
                const SizedBox(
                    width: 10), // Memberikan ruang antara ikon dan teks
                Text(
                  'INQUIRY',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
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
