import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../helper/helper_class.dart';
import '../theme.dart';
import '../widget/navbar_wh.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              NavbarTitleWidget(title: 'PRODUCTS', url: ''),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CLIENTS', url: ''),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CASE STUDIES', url: ''),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'CONTACT', url: ''),
              SizedBox(
                width: 30,
              ),
              NavbarTitleWidget(title: 'BLOG', url: ''),
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
              const NavbarTitleWidget(title: 'PRODUCTS', url: ''),
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
              const NavbarTitleWidget(title: 'CLIENTS', url: ''),
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
              const NavbarTitleWidget(title: 'CASE STUDIES', url: ''),
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
              const NavbarTitleWidget(title: 'CONTACT', url: ''),
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
              const NavbarTitleWidget(title: 'BLOG', url: ''),
            ],
          );
  }
}
