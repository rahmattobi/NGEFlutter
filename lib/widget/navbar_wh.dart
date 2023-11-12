import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/theme.dart';

class NavbarTitleWidget extends StatefulWidget {
  final String title;
  final String url;

  const NavbarTitleWidget({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  _NavbarTitleWidgetState createState() => _NavbarTitleWidgetState();
}

class _NavbarTitleWidgetState extends State<NavbarTitleWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return FadeInRight(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: GestureDetector(
          onTap: () {
            widget.url;
          },
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: size.width < 800 ? 12 : 14,
              fontFamily: 'Montserrat',
              fontWeight: semiBold,
              color: size.width < 1200
                  ? whiteColor
                  : isHovered
                      ? titleColor
                      : subtitleColor,
            ),
          ),
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
