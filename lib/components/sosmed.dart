import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class Sosmed extends StatefulWidget {
  const Sosmed({Key? key}) : super(key: key);

  @override
  State<Sosmed> createState() => _SosmedState();
}

class _SosmedState extends State<Sosmed> {
  bool isHovered2 = false;
  bool isHovered3 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FadeInUp(
          child: GestureDetector(
            onTap: () {
              launch('https://twitter.com/NatunaGlobal');
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: subtitleColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/twitter.png',
                    height: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        FadeInDown(
          child: GestureDetector(
            onTap: () {
              launch('https://www.instagram.com/natunaglobal/');
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: isHovered2 ? Colors.pink : Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: subtitleColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/ig.png',
                    height: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        FadeInRight(
          child: GestureDetector(
            onTap: () {
              launch('https://www.linkedin.com/company/natunaglobal/');
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: isHovered3 ? titleColor : Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: subtitleColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/linkedin.png',
                    height: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
