import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../helper/helper_class.dart';
import '../theme.dart';
import '../widget/navbar_wh.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return HelperClass.desktopScreen(context)
        ? const Row(
            children: [
              NavbarTitleWidget(title: 'HOME', url: '/home'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'ABOUT', url: '/about'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'PRODUCTS', url: '/product'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CLIENTS', url: '/client'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CASE STUDIES', url: '/cs'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CONTACT', url: '/contact'),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'BLOG', url: '/blog'),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavbarTitleWidget(title: 'HOME', url: '/home'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'ABOUT', url: '/about'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'PRODUCTS', url: '/product'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'CLIENTS', url: '/client'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'CASE STUDIES', url: '/cs'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'CONTACT', url: '/contact'),
              const SizedBox(
                height: 15,
              ),
              FadeInRight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: subtitleColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NavbarTitleWidget(title: 'BLOG', url: '/blog'),
              const SizedBox(
                height: 15,
              ),
              size.width >= 800
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: subtitleColor.withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const NavbarTitleWidget(
                            title: 'INQUIRY', url: '/inquiry'),
                      ],
                    ),
            ],
          );
  }
}
