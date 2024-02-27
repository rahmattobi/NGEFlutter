import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../components/footer.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/helper_class.dart';
import '../theme.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

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
                                // Fungsi yang akan dijalankan saat tombol ditekan
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
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    jdlClient('OUR CLIENTS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    cpCard(
                      'assets/images/polairud.png',
                      'Korpolairud Baharkam Polri',
                      size,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cpCard(
                      'assets/images/pelindo.png',
                      'PT IPC Terminal Petikemas',
                      size,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cpCard(
                      'assets/images/alfa.png',
                      'PT Alfa Kencana Samudra',
                      size,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cpCard(
                      'assets/images/kitahoki.png',
                      'PT Kita Hokki',
                      size,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    jdlClient('OUR PARTNERS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    cpCard(
                      'assets/images/netra.png',
                      'PT Netra Teknologi Nusantara',
                      size,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cpCard(
                      'assets/images/jawara.png',
                      'PT Jawara Arkatama Wisesa',
                      size,
                    ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
        tablet: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    jdlClient('OUR CLIENTS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cpCard(
                          'assets/images/polairud.png',
                          'Korpolairud Baharkam Polri',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/pelindo.png',
                          'PT IPC Terminal Petikemas',
                          size,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cpCard(
                          'assets/images/alfa.png',
                          'PT Alfa Kencana Samudra',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/kitahoki.png',
                          'PT Kita Hokki',
                          size,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    jdlClient('OUR PARTNERS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cpCard(
                          'assets/images/netra.png',
                          'PT Netra Teknologi Nusantara',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/jawara.png',
                          'PT Jawara Arkatama Wisesa',
                          size,
                        ),
                      ],
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
        desktop: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    jdlClient('OUR CLIENTS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cpCard(
                          'assets/images/polairud.png',
                          'Korpolairud Baharkam Polri',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/pelindo.png',
                          'PT IPC Terminal Petikemas',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/alfa.png',
                          'PT Alfa Kencana Samudra',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/kitahoki.png',
                          'PT Kita Hokki',
                          size,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    jdlClient('OUR PARTNERS', size),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cpCard(
                          'assets/images/netra.png',
                          'PT Netra Teknologi Nusantara',
                          size,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        cpCard(
                          'assets/images/jawara.png',
                          'PT Jawara Arkatama Wisesa',
                          size,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width > 1200 && size.width < 1300 ? 280 : 50,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Text jdlClient(String jdl, Size size) {
    return Text(
      jdl,
      style: primaryTextStyle.copyWith(
        fontWeight: bold,
        fontSize: size.width <= 800 ? 25 : 45,
      ),
    );
  }

  Column cpCard(String img, String jdl, Size size) {
    return Column(
      children: [
        Container(
          width: size.width < 800
              ? size.width * 0.8
              : ((size.width >= 800 && size.width < 1200)
                  ? size.width * 1 / 3
                  : size.width * 1 / 5),
          height: size.width < 1200 ? 200 : 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Warna bayangan
                spreadRadius: 2, // Seberapa tersebar bayangan
                blurRadius: 20, // Seberapa buram bayangan
                offset: const Offset(0, 3), // Posisi bayangan (x, y)
              ),
            ],
            image: DecorationImage(
              image: AssetImage(
                img.toString(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          jdl,
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
