import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/helper/helperClass.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/blog_wh.dart';
import 'package:nge/widget/product_wh.dart';
import 'package:typewritertext/typewritertext.dart';

import '../components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController1 = ScrollController();
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const Navbar(),
      body: HelperClass(
        mobile: SingleChildScrollView(
          child: mobileLayout(size),
        ),
        tablet: SingleChildScrollView(
          child: tabletLayout(size),
        ),
        desktop: SingleChildScrollView(
          child: desktopLayout(size),
        ),
      ),
    );
  }

// Mobile Layout
  Column mobileLayout(Size size) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  duration: const Duration(seconds: 3),
                  child: Container(
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bann.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInLeft(
                      child: Text(
                        "WELCOME TO NATUNA",
                        style: titleTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TypeWriterText(
                      text: Text(
                        'Building A Smarter Tomorrow, Today...       ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 25,
                          fontWeight: bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 150),
                      repeat: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInDown(
                      child: SizedBox(
                        width: 120,
                        child: AppTheme.customTextButton(
                          text: 'ABOUT',
                          onPressed: () {},
                          btnColor: titleColor,
                          hvrColor: titleColor,
                          txtBtnColor: whiteColor,
                          fontWeight: bold,
                          horizontal: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.7,
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
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                final newScrollOff =
                    scrollController1.offset - (details.delta.dx * 2);
                scrollController1.jumpTo(newScrollOff);
              },
              child: SingleChildScrollView(
                controller: scrollController1,
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
                        width: size.width,
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
                        child: FadeInLeft(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.3,
                              ),
                              child: ProductWidgetHome(
                                img: 'assets/images/ship-wheel.png',
                                judul: '1WAVE',
                                desc:
                                    'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                              ),
                            ),
                          ),
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
                        width: size.width,
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
                        child: FadeInDown(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.3,
                            ),
                            child: ProductWidgetHome(
                              img: 'assets/images/server.png',
                              judul: '1HUB',
                              desc:
                                  'Our advanced technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                            ),
                          ),
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
                        width: size.width,
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
                        child: FadeInRight(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.3,
                            ),
                            child: ProductWidgetHome(
                              img: 'assets/images/iot.png',
                              judul: '1THINGS',
                              desc:
                                  'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: Text(
                    '___ WHAT’S NEW',
                    style: titleTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FadeInUp(
                  child: Text(
                    'BLOG & ARTICLE',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                    child: FadeInRight(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: size.width * 0.5,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bann.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom:
                                    0, // Mengatur posisi container judul di bagian bawah tumpukan
                                left: 5,
                                right: 5,
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: darkTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: subtitleColor,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Jakarta, 11 November 2023',
                                              style: subtitleTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return titleDarkColor; // Warna latar belakang saat tombol di-hover
                          }
                          return titleColor; // Warna latar belakang saat tidak di-hover
                        },
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                          horizontal: 45,
                          vertical: 20,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "SEE MORE",
                      style: titleTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 12,
                        letterSpacing: 2,
                        color: whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }

  Column tabletLayout(Size size) {
    return Column(
      children: [
        Footer(),
      ],
    );
  }

  Column desktopLayout(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                bottom: 90,
                child: FadeInRight(
                  duration: const Duration(seconds: 4),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.8,
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
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLeft(
                              child: Text(
                                "WELCOME TO NATUNA",
                                style: titleTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TypeWriterText(
                              text: Text(
                                'Building A Smarter Tomorrow,\nToday..     ',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 40,
                                  fontWeight: bold,
                                ),
                              ),
                              duration: const Duration(milliseconds: 150),
                              repeat: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FadeInDown(
                              child: AppTheme.customTextButton(
                                text: 'ABOUT',
                                onPressed: () {},
                                btnColor: titleColor,
                                hvrColor: titleColor,
                                txtBtnColor: whiteColor,
                                fontWeight: bold,
                                horizontal: 40,
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
          height: size.height,
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
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                final scrollOff =
                    scrollController1.offset - (details.delta.dx * 2);
                scrollController1.jumpTo(scrollOff);
              },
              child: SingleChildScrollView(
                controller: scrollController1,
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
                        width: size.width * 1 / 3,
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
                        child: FadeInLeft(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.6,
                              ),
                              child: ProductWidgetHome(
                                img: 'assets/images/ship-wheel.png',
                                judul: '1WAVE',
                                desc:
                                    'Tracking, monitoring and regulating the inspection process and maintenance procedures of all assets to help businesses keeping track of their valuable assets in real-time.',
                              ),
                            ),
                          ),
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
                        width: size.width * 1 / 3,
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
                        child: FadeInDown(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.6,
                            ),
                            child: ProductWidgetHome(
                              img: 'assets/images/server.png',
                              judul: '1HUB',
                              desc:
                                  'Our advanced technology and expertise in data collection and analysis ensure that our clients have access to the most up-to-date and accurate information for their needs.',
                            ),
                          ),
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
                        width: size.width * 1 / 3,
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
                        child: FadeInRight(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.6,
                            ),
                            child: ProductWidgetHome(
                              img: 'assets/images/iot.png',
                              judul: '1THINGS',
                              desc:
                                  'We provide cutting-edge Internet of Things (IOT) solutions that are designed to streamline and optimize your business operations.',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
            width: size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInLeft(
                          child: Text(
                            '___ WHAT’S NEW',
                            style: titleTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FadeInUp(
                          child: Text(
                            'BLOG & ARTICLE',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 43,
                            ),
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
                    child: FadeInRight(
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
                ),
                const SizedBox(
                  height: 80,
                ),
                FadeInDown(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                ),
              ],
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }
}
