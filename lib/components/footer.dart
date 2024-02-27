import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper_class.dart';
import '../theme.dart';
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
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      desktop: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 80,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  alamatFooter(size),
                  linkFooter(size),
                  infoFooter(size),
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
                  FadeInLeft(child: cpFooter(size)),
                  Row(
                    children: [
                      termFooter(size),
                      const SizedBox(
                        width: 20,
                      ),
                      ppFooter(size),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      mobile: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  alamatFooter(size),
                  const SizedBox(
                    height: 30,
                  ),
                  linkFooter(size),
                  const SizedBox(
                    height: 30,
                  ),
                  infoFooter(size),
                  const SizedBox(
                    height: 20,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(child: cpFooter(size)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: termFooter(size),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FadeInRight(
                        child: ppFooter(size),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      tablet: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: alamatFooter(size),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: linkFooter(size),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: infoFooter(size),
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
                  SizedBox(
                    width: size.width * 0.5,
                    child: FadeInLeft(
                      child: cpFooter(size),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: termFooter(size),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: ppFooter(size),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column alamatFooter(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          child: Image.asset(
            'assets/images/natuna1.png',
            width: size.width < 800 ? size.width * 0.3 : size.width * 0.15,
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        FadeInLeft(
          child: Text(
            'HEAD OFFICE',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInRight(
          child: SelectableText(
            'EduCenter Building Lt. 2A Unit 22592, Jl. Sekolah Foresta No. 8, BSD City - Banten 15331,\nIndonesia',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        FadeInUp(
          child: Text(
            'CORPORATE OFFICE',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInDown(
          child: SelectableText(
            'Jl. Boulevard Europa No.10 RT.001/RW.009, Panunggangan Barat, Kec. Cibodas, Kota Tangerang,\nBanten 15138 Indonesia',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            FadeInLeft(
              child: GestureDetector(
                onTap: () {
                  launch('https://twitter.com/NatunaGlobal');
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => onHover(true),
                  onExit: (_) => onHover(false),
                  child: Container(
                    height: size.width < 800 ? 40 : 50,
                    width: size.width < 800 ? 40 : 50,
                    decoration: BoxDecoration(
                      color: isHovered ? Colors.black : Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: subtitleColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/twitter.png',
                        height: size.width < 800 ? 15 : 18,
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
                  onEnter: (_) => onHover2(true),
                  onExit: (_) => onHover2(false),
                  child: Container(
                    height: size.width < 800 ? 40 : 50,
                    width: size.width < 800 ? 40 : 50,
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
                        height: size.width < 800 ? 15 : 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FadeInUp(
              child: GestureDetector(
                onTap: () {
                  launch('https://www.linkedin.com/company/natunaglobal/');
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => onHover3(true),
                  onExit: (_) => onHover3(false),
                  child: Container(
                    height: size.width < 800 ? 40 : 50,
                    width: size.width < 800 ? 40 : 50,
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
                        height: size.width < 800 ? 15 : 18,
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
        ),
      ],
    );
  }

  Column linkFooter(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          child: Text(
            'Useful links',
            style: whiteTextStyle.copyWith(
              fontSize: size.width < 800 ? 20 : 25,
              fontWeight: size.width < 800 ? regular : semiBold,
            ),
          ),
        ),
        SizedBox(
          height: size.width < 800 ? 20 : 25,
        ),
        const NavbarTitleWidget(title: 'HOME', url: '/home'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'ABOUT', url: '/about'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'PRODUCTS', url: '/product'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'CLIENTS', url: '/client'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'CASE STUDIES', url: '/cs'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'CONTACT', url: '/contact'),
        SizedBox(
          height: size.width < 800 ? 20 : 15,
        ),
        const NavbarTitleWidget(title: 'BLOG', url: '/blog'),
      ],
    );
  }

  Column infoFooter(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInRight(
          child: Text(
            'Contact Info',
            style: whiteTextStyle.copyWith(
              fontSize: size.width < 800 ? 20 : 25,
              fontWeight: size.width < 800 ? regular : semiBold,
            ),
          ),
        ),
        SizedBox(
          height: size.width < 800 ? 15 : 25,
        ),
        FadeInLeft(
          child: SelectableText(
            '+62 21 508 862 05',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInUp(
          child: SelectableText(
            'info@natuna.global',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInRight(
          child: Text(
            'Office Hours: 08.00 - 17.00',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInDown(
          child: Text(
            'Monday - Friday',
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
      ],
    );
  }

  Text cpFooter(Size size) {
    return Text(
      '© Copyright ©2020 Natuna Global. All Rights Reserved Copyright',
      textAlign: TextAlign.center,
      style: whiteTextStyle.copyWith(
        fontWeight: size.width < 800 ? medium : semiBold,
        fontSize: size.width < 800 ? 13 : 14,
      ),
    );
  }

  Text termFooter(Size size) {
    return Text(
      'Terms and conditions',
      style: subtitleTextStyle.copyWith(
        fontWeight: size.width < 800 ? medium : semiBold,
        fontSize: size.width < 800 ? 13 : 14,
      ),
    );
  }

  Text ppFooter(Size size) {
    return Text(
      'Privacy policy',
      style: subtitleTextStyle.copyWith(
        fontWeight: size.width < 800 ? medium : semiBold,
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
