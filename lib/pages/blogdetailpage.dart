import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/helper/helper_class.dart';
import 'package:nge/theme.dart';
import 'package:nge/widget/mobile_card.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';

class BlogDetailPage extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/bann.jpg',
    'assets/images/jawara.png',
    'assets/images/kitahoki.png',
    'assets/images/netra.png',
    'assets/images/pelindo.png',
  ];

  BlogDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: titleBlog(
                        size,
                        'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInRight(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: descBlog(size,
                            'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your vessel’s direction.\n\nWhether you’re navigating the open sea or managing a fleet, having real-time insights into headings and courses is essential for safe and efficient maritime operations. With 1Wave, you can access this critical information with ease.\n\nOur application offers a range of powerful features, including real-time tracking, speed monitoring, travel history, weather forecasts, and geofence alerts, ensuring that you have all the tools you need to make informed decisions while at sea.\n\nDon’t miss out on the opportunity to enhance your maritime experience. Explore the capabilities of 1Wave today and discover how it can revolutionize your vessel tracking and fleet management. Set sail with confidence, knowing that you have the best technology at your fingertips.'),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Recent Post',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MobileCard(
                      img: 'assets/images/bann.jpg',
                      title:
                          'lorem ipsum Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                      desc:
                          'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your',
                    )
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
        tablet: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: titleBlog(
                        size,
                        'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInRight(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: descBlog(size,
                            'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your vessel’s direction.\n\nWhether you’re navigating the open sea or managing a fleet, having real-time insights into headings and courses is essential for safe and efficient maritime operations. With 1Wave, you can access this critical information with ease.\n\nOur application offers a range of powerful features, including real-time tracking, speed monitoring, travel history, weather forecasts, and geofence alerts, ensuring that you have all the tools you need to make informed decisions while at sea.\n\nDon’t miss out on the opportunity to enhance your maritime experience. Explore the capabilities of 1Wave today and discover how it can revolutionize your vessel tracking and fleet management. Set sail with confidence, knowing that you have the best technology at your fingertips.'),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Recent Post',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 150,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: subtitleColor.withOpacity(0.3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          FadeInLeft(
                            child: Container(
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/bann.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 30,
                                left: 30,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeInUp(
                                    child: Text(
                                      'lorem ipsum Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                                      style: primaryTextStyle.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FadeInDown(
                                    child: Text(
                                      'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your',
                                      style: subtitleTextStyle.copyWith(
                                        fontWeight: medium,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.6,
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInDown(
                            child: titleBlog(
                              size,
                              'Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInRight(
                            child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 2,
                                enlargeCenterPage: true,
                              ),
                              items: imageSliders,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInUp(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: descBlog(size,
                                  'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your vessel’s direction.\n\nWhether you’re navigating the open sea or managing a fleet, having real-time insights into headings and courses is essential for safe and efficient maritime operations. With 1Wave, you can access this critical information with ease.\n\nOur application offers a range of powerful features, including real-time tracking, speed monitoring, travel history, weather forecasts, and geofence alerts, ensuring that you have all the tools you need to make informed decisions while at sea.\n\nDon’t miss out on the opportunity to enhance your maritime experience. Explore the capabilities of 1Wave today and discover how it can revolutionize your vessel tracking and fleet management. Set sail with confidence, knowing that you have the best technology at your fingertips.'),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 100),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: subtitleColor.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recent Post',
                              style: primaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: size.width,
                              margin: const EdgeInsets.only(bottom: 15),
                              height: 120,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: subtitleColor.withOpacity(0.3),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  FadeInLeft(
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bann.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FadeInUp(
                                            child: Text(
                                              'lorem ipsum Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          FadeInDown(
                                            child: Text(
                                              'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your',
                                              style: subtitleTextStyle.copyWith(
                                                fontWeight: medium,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: size.width,
                              margin: const EdgeInsets.only(bottom: 15),
                              height: 120,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: subtitleColor.withOpacity(0.3),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  FadeInLeft(
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bann.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FadeInUp(
                                            child: Text(
                                              'lorem ipsum Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          FadeInDown(
                                            child: Text(
                                              'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your',
                                              style: subtitleTextStyle.copyWith(
                                                fontWeight: medium,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: size.width,
                              margin: const EdgeInsets.only(bottom: 15),
                              height: 120,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: subtitleColor.withOpacity(0.3),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  FadeInLeft(
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bann.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FadeInUp(
                                            child: Text(
                                              'lorem ipsum Unlock the Power of Real-Time Heading and Course Tracking with 1Wave!',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          FadeInDown(
                                            child: Text(
                                              'Have you ever wondered how to keep a close eye on your vessel’s headings and courses in real time? Look no further! With 1Wave, our cutting-edge application empowers you to effortlessly monitor both headings and courses, allowing you to maintain precise control over your',
                                              style: subtitleTextStyle.copyWith(
                                                fontWeight: medium,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
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

  Text titleBlog(Size size, String title) {
    return Text(
      title,
      style: primaryTextStyle.copyWith(
        fontWeight: semiBold,
        fontSize: 24,
      ),
    );
  }

  Text descBlog(Size size, String desc) {
    return Text(
      desc,
      style: subtitleTextStyle.copyWith(
        fontWeight: medium,
        fontSize: 15,
      ),
    );
  }
}
