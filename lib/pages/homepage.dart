import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/components/navbar.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/blog_wh.dart';
import 'package:nge/widget/product_wh.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper_class.dart';
import '../widget/navbar_wh.dart';

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
      appBar: HelperClass.desktopScreen(context)
          ? PreferredSize(
              preferredSize: Size(size.width, size.height),
              child: const Navbar(),
            )
          : AppBar(
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
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: menuMob(),
                ),
                const SizedBox(
                  height: 40,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: contactUs(),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: sosmed(size),
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
                    imgHome(size),
                    const SizedBox(
                      height: 20,
                    ),
                    wlcTextHome(size),
                  ],
                ),
              ),
              prdHome(size),
              const SizedBox(
                height: 20,
              ),
              blogHome(size),
              // FOOTER
              const Footer(),
            ],
          ),
        ),
        tablet: Column(
          children: [
            SizedBox(
              height: 100,
            ),

            // FOOTER
            Footer(),
          ],
        ),
        desktop: SingleChildScrollView(
          child: tabletLayout1(size),
        ),
      ),
    );
  }

  Container prdHome(Size size) {
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/bg2.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black
                .withOpacity(0.6), // Warna hitam dengan tingkat kejernihan 50%
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
                      padding: EdgeInsets.only(
                        top: size.height * 0.18,
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
                        top: size.height * 0.18,
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
                        top: size.height * 0.18,
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
    );
  }

  FadeInDown imgHome(Size size) {
    return FadeInDown(
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
    );
  }

  Column wlcTextHome(Size size) {
    return Column(
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
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                color: titleColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "ABOUT",
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Padding blogHome(Size size) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 70,
        left: 30,
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
                  fontSize: 25,
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
                  right: 20,
                ),
                child: FadeInRight(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            Container(
                              width: size.width * 0.6,
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
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 2,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            Container(
                              width: size.width * 0.6,
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
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 2,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            Container(
                              width: size.width * 0.6,
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
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 2,
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
    );
  }

// Mobile Layout
  Column mobileLayout(Size size) {
    return Column(
      children: [
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

  Column tabletLayout1(Size size) {
    return Column(
      children: [
        Text(
          "INI Desktop 1",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 100),
        ),
        const Footer(),
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

  Column menuMob() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NavbarTitleWidget(title: 'HOME', url: ''),
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
        const NavbarTitleWidget(title: 'ABOUT', url: ''),
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

  Column contactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          child: Text(
            'CONTACT US',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FadeInUp(
          child: Text(
            'HEAD OFFICE',
            style: whiteTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInDown(
          child: SelectableText(
            'EduCenter Building Lt. 2A Unit 22592, Jl. Sekolah Foresta No. 8, BSD City - Banten 15331,\nIndonesia',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInUp(
          child: Text(
            'CORPORATE OFFICE',
            style: whiteTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInDown(
          child: SelectableText(
            'Jl. Boulevard Europa No.10 RT.001/RW.009, Panunggangan Barat, Kec. Cibodas, Kota Tangerang,\nBanten 15138 Indonesia',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FadeInDown(
          child: SelectableText(
            '+62 21 508 862 05',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 05,
        ),
        FadeInUp(
          child: SelectableText(
            'info@natuna.global',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Row sosmed(Size size) {
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
