import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/blog_wh.dart';
import 'package:nge/widget/product_wh.dart';

import '../components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 90,
                    child: Container(
                      width: screenWidth * 0.45,
                      height: screenHeight * 0.8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bann.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(650),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "WELCOME TO NATUNA",
                                  style: titleTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Building A Smarter Tomorrow,\nToday",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 40,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.hovered)) {
                                          return titleDarkColor; // Warna latar belakang saat tombol di-hover
                                        }
                                        return titleColor; // Warna latar belakang saat tidak di-hover
                                      },
                                    ),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(
                                        horizontal: 45,
                                        vertical: 30,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "ABOUT",
                                    style: titleTextStyle.copyWith(
                                      fontWeight: bold,
                                      letterSpacing: 2,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/bg2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.6), // Warna hitam dengan tingkat kejernihan 50%
                      BlendMode
                          .darken, // BlendMode yang Anda inginkan (contohnya, darken)
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent, // Warna transparan di atas gambar
                      primaryColor, // Warna gradasi (misalnya, hitam dengan tingkat kejernihan 50%)
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovered1 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovered1 = false;
                          });
                        },
                        child: Container(
                          width: screenWidth * 1 / 3,
                          decoration: BoxDecoration(
                            color: isHovered1
                                ? titleColor.withOpacity(0.7)
                                : Colors.transparent,
                            border: const Border(
                              right: BorderSide(
                                color: Colors.white, // Warna border putih
                                width: 0.3, // Lebar border sesuai kebutuhan
                              ),
                            ),
                          ),
                          child: ProductWidgetHome(
                            img: 'assets/images/ship-wheel.png',
                            judul: '1WAVE',
                            desc:
                                'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovered2 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovered2 = false;
                          });
                        },
                        child: Container(
                          width: screenWidth * 1 / 3,
                          decoration: BoxDecoration(
                            color: isHovered2
                                ? titleColor.withOpacity(0.7)
                                : Colors.transparent,
                            border: const Border(
                              right: BorderSide(
                                color: Colors.white, // Warna border putih
                                width: 0.3, // Lebar border sesuai kebutuhan
                              ),
                            ),
                          ),
                          child: ProductWidgetHome(
                            img: 'assets/images/server.png',
                            judul: '1HUB',
                            desc:
                                'Our advanced technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovered3 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovered3 = false;
                          });
                        },
                        child: Container(
                          width: screenWidth * 1 / 3,
                          decoration: BoxDecoration(
                            color: isHovered3
                                ? titleColor.withOpacity(0.7)
                                : Colors.transparent,
                            border: const Border(
                              right: BorderSide(
                                color: Colors.white, // Warna border putih
                                width: 0.3, // Lebar border sesuai kebutuhan
                              ),
                            ),
                          ),
                          child: ProductWidgetHome(
                            img: 'assets/images/iot.png',
                            judul: '1THINGS',
                            desc:
                                'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120,
                bottom: 70,
                left: 70,
              ),
              child: SizedBox(
                width: screenWidth,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '___ WHAT’S NEW',
                              style: titleTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'BLOG & ARTICLE',
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 43,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final newScrollOffset =
                            scrollController.offset - (details.delta.dx * 2);
                        scrollController.jumpTo(newScrollOffset);
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                          right: 60,
                        ),
                        child: Row(
                          children: [
                            BlogWidgetHome(
                              img: 'assets/images/bann.jpg',
                              title:
                                  'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                              date: 'Tuesday, October 10, 2023',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            BlogWidgetHome(
                              img: 'assets/images/bann.jpg',
                              title:
                                  'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                              date: 'Tuesday, October 10, 2023',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            BlogWidgetHome(
                              img: 'assets/images/bann.jpg',
                              title:
                                  'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                              date: 'Tuesday, October 10, 2023',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            BlogWidgetHome(
                              img: 'assets/images/bann.jpg',
                              title:
                                  'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                              date: 'Tuesday, October 10, 2023',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return titleDarkColor; // Warna latar belakang saat tombol di-hover
                            }
                            return titleColor; // Warna latar belakang saat tidak di-hover
                          },
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                            horizontal: 65,
                            vertical: 30,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "SEE MORE",
                        style: titleTextStyle.copyWith(
                          fontWeight: bold,
                          letterSpacing: 2,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
