import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/contact_us.dart';
import 'package:nge/components/sosmed.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/product_card.dart';

import '../components/footer.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../helper/helper_class.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
                  title: MouseRegion(
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
                            },
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                (Set<MaterialState> states) {
                                  // Memberikan efek shadow saat tombol di-hover
                                  return states.contains(MaterialState.hovered)
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
                  centerTitle: false,
                )
              : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: whiteColor,
                  elevation: 0,
                  iconTheme: IconThemeData(color: primaryColor),
                  title: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Padding(
                      padding: EdgeInsets.all(
                          HelperClass.mobileScreen(context) ? 8.0 : 30),
                      child: Image.asset(
                        'assets/images/natuna2.png',
                        width: 150,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 30,
                    ),
                    ProductCard(
                      img: 'assets/images/1wave.png',
                      type: 'ASSET MONITORING',
                      judul: '1WAVE',
                      desc:
                          'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                      url: '/1wave-pricing',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ProductCard(
                      img: 'assets/images/1hub.jpg',
                      type: 'PUBLIC DATA',
                      judul: '1HUB',
                      desc:
                          'Our advance technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                      url: '',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ProductCard(
                      img: 'assets/images/1things.jpg',
                      type: 'INTERNET OF THINGS (IOT)',
                      judul: '1THINGS',
                      desc:
                          'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                      url: '',
                    ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width >= 800 ? 40 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCard(
                          img: 'assets/images/1wave.png',
                          type: 'ASSET MONITORING',
                          judul: '1WAVE',
                          desc:
                              'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                          url: '/1wave-pricing',
                        ),
                        ProductCard(
                          img: 'assets/images/1hub.jpg',
                          type: 'PUBLIC DATA',
                          judul: '1HUB',
                          desc:
                              'Our advance technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                          url: '',
                        ),
                        ProductCard(
                          img: 'assets/images/1things.jpg',
                          type: 'INTERNET OF THINGS (IOT)',
                          judul: '1THINGS',
                          desc:
                              'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                          url: '',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              // FOOTER
              const Footer(),
            ],
          ),
        ),
        desktop: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCard(
                          img: 'assets/images/1wave.png',
                          type: 'ASSET MONITORING',
                          judul: '1WAVE',
                          desc:
                              'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                          url: '/1wave-pricing',
                        ),
                        ProductCard(
                          img: 'assets/images/1hub.jpg',
                          type: 'PUBLIC DATA',
                          judul: '1HUB',
                          desc:
                              'Our advance technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                          url: '',
                        ),
                        ProductCard(
                          img: 'assets/images/1things.jpg',
                          type: 'INTERNET OF THINGS (IOT)',
                          judul: '1THINGS',
                          desc:
                              'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                          url: '',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.width > 1200 && size.width < 1300 ? 387 : 50,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Column titleProduct(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '__ OUR PRODUCTS',
          style: titleTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: size.width > 1200 ? 20 : 14,
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 20 : 15,
        ),
        Text(
          'HIGHLIGHTS',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: size.width > 1200 ? 50 : 32,
          ),
        ),
      ],
    );
  }
}
