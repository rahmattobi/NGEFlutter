import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/contact_us.dart';
import 'package:nge/components/sosmed.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/btn_title.dart';

import '../components/footer.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../helper/helper_class.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: HelperClass.desktopScreen(context)
          ? PreferredSize(
              preferredSize: Size(size.width, size.height),
              child: const Navbar(),
            )
          : HelperClass.ipadScreen(context)
              ? AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: whiteColor,
                  elevation: 0,
                  iconTheme: IconThemeData(color: primaryColor),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: EdgeInsets.all(
                            HelperClass.mobileScreen(context) ? 8.0 : 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/natuna2.png',
                              width: 150,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/inquiry');
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                elevation:
                                    MaterialStateProperty.resolveWith<double>(
                                  (Set<MaterialState> states) {
                                    // Memberikan efek shadow saat tombol di-hover
                                    return states
                                            .contains(MaterialState.hovered)
                                        ? 8
                                        : 0;
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
                                      width:
                                          10), // Memberikan ruang antara ikon dan teks
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
                      ),
                    ),
                  ),
                  centerTitle: false,
                )
              : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: whiteColor,
                  elevation: 0,
                  iconTheme: IconThemeData(color: primaryColor),
                  title: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                            HelperClass.mobileScreen(context) ? 8.0 : 30),
                        child: Image.asset(
                          'assets/images/natuna2.png',
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  centerTitle: false,
                ),
      endDrawer: Drawer(
        width: HelperClass.mobileScreen(context)
            ? size.width * 0.7
            : size.width * 0.5,
        backgroundColor: primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: HelperClass.mobileScreen(context) ? 20 : 40,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                FadeInDown(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Image.asset(
                      'assets/images/natuna1.png',
                      height: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: MenuNav(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: ContactUs(),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Sosmed(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: HelperClass(
        mobile: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    imgAbout(size),
                    const SizedBox(
                      height: 20,
                    ),
                    aboutUs(size),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // FOOTER
              const Footer(),
            ],
          ),
        ),
        tablet: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(size.width >= 800 ? 40 : 20),
              child: Column(
                children: [
                  imgAbout(size),
                  SizedBox(
                    height: size.width >= 800 ? 50 : 20,
                  ),
                  aboutUs(size),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // FOOTER
            const Footer(),
          ]),
        ),
        desktop: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: size.width * 1 / 2, child: aboutUs(size)),
                    Expanded(
                      child: imgAbout(size),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  FadeInDown imgAbout(Size size) {
    return FadeInDown(
      duration: const Duration(seconds: 3),
      child: Container(
        height: size.width > 1200
            ? size.height * 0.5
            : ((size.width >= 800 && size.width < 1200)
                ? size.height * 0.4
                : size.height * 0.3),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/about-bg.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Column aboutUs(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          child: Text(
            'ABOUT US',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width < 800 ? 25 : 36,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FadeInRight(
          child: Text(
            size.width > 1200
                ? 'We are passionate about harnessing the power of the Internet of Things (IoT)\nto transform the way we live and work. Our team of experts dedicate to provide\ninnovative solutions that help our clients leverage the full potential of IoT technology.\nWith a focus on cutting-edge developments and a commitment to excellence\n we are proud to be at the forefront of the IoT revolution.\nWe believe that the possibilities are endless, and we are excited to help you explore them.'
                : 'We are passionate about harnessing the power of the Internet of Things (IoT) to transform the way we live and work. Our team of experts dedicate to provide innovative solutions that help our clients leverage the full potential of IoT technology. With a focus on cutting-edge developments and a commitment to excellence, we are proud to be at the forefront of the IoT revolution. We believe that the possibilities are endless, and we are excited to help you explore them.',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: size.width < 800 ? 14 : 15,
            ),
          ),
        ),
        SizedBox(
          height: size.width >= 800 ? 50 : 20,
        ),
        Align(
          alignment: (size.width >= 800 && size.width < 1200)
              ? Alignment.center
              : Alignment.centerLeft,
          child: BtnTitle(
            pdHorizontal: size.width > 1200 ? 60 : 40,
            pdVertical: size.width > 1200 ? 30 : 30,
            fontSize: size.width < 800 ? 12 : 15,
            title: 'OUR SERVICES & PRODUCTS',
            url: '/product',
          ),
        )
      ],
    );
  }
}
