import 'package:flutter/material.dart';
import 'package:nge/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/navbar_wh.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isHovered = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/natuna1.png',
                            width: 200,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'HEAD OFFICE',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SelectableText(
                            'EduCenter Building Lt. 2A Unit 22592, Jl. Sekolah Foresta No. 8, BSD City - Banten 15331,\nIndonesia',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'CORPORATE OFFICE',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SelectableText(
                            'Jl. Boulevard Europa No.10 RT.001/RW.009, Panunggangan Barat, Kec. Cibodas, Kota Tangerang,\nBanten 15138 Indonesia',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Useful links',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const NavbarTitleWidget(title: 'HOME', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(title: 'ABOUT', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(
                                  title: 'PRODUCTS', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(
                                  title: 'CLIENTS', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(
                                  title: 'CASE STUDIES', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(
                                  title: 'CONTACT', url: ''),
                              const SizedBox(
                                height: 15,
                              ),
                              const NavbarTitleWidget(title: 'BLOG', url: ''),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Info',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SelectableText(
                                '+62 21 508 862 05',
                                style: subtitleTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SelectableText(
                                'info@natuna.global',
                                style: subtitleTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Office Hours: 08.00 - 17.00',
                                style: subtitleTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Monday - Friday',
                                style: subtitleTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch('https://twitter.com/NatunaGlobal');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => onHover(true),
                          onExit: (_) => onHover(false),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  isHovered ? Colors.black : Colors.transparent,
                              border: Border.all(
                                width: 1,
                                color: subtitleColor.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/twitter.png',
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch('https://www.instagram.com/natunaglobal/');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => onHover2(true),
                          onExit: (_) => onHover2(false),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  isHovered2 ? Colors.pink : Colors.transparent,
                              border: Border.all(
                                width: 1,
                                color: subtitleColor.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/ig.png',
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.linkedin.com/company/natunaglobal/');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => onHover3(true),
                          onExit: (_) => onHover3(false),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  isHovered3 ? titleColor : Colors.transparent,
                              border: Border.all(
                                width: 1,
                                color: subtitleColor.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/linkedin.png',
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            border: Border(
              top: BorderSide(
                color: subtitleColor,
                width: 0.2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© Copyright ©2020 Natuna Global. All Rights Reserved Copyright',
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Terms and conditions',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Privacy policy',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
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
