import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/helper/helper_class.dart';
import 'package:nge/widget/cs_card.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../theme.dart';

class CaseStudiesPage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  CaseStudiesPage({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleCs(size),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final newScrollOff =
                            scrollController.offset - (details.delta.dx * 2);
                        scrollController.jumpTo(newScrollOff);
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CsCard(
                              title: 'Korpolairud Baharkam Polri',
                              img: 'assets/images/polairud.png',
                              desc:
                                  'Natuna Global being a technology partner who could understand its business needs, develop a scalable and user-friendly application, and provide ongoing support and maintenance. DMS Project aimed to improve database, vessel and aircraft management system of Korpolairud Baharkam Polri, it has several function, include: Data visualization, Performance monitoring, Resource allocation, Risk management, Communication and collaboration.',
                            ),
                            CsCard(
                              title: 'PT IPC Terminal Petikemas',
                              img: 'assets/images/pelindo.png',
                              desc:
                                  'We developed a custom software application that collects data from AIS and displays it in real-time on a web-based dashboard. The dashboard provides the client with insights into the performance of their vessels and other maritime traffic, allowing them to identify and address issues in real-time. The solution we provided also includes geofencing capabilities, allowing the client to set up virtual boundaries around specific areas of the port. This enables them to monitor vessel traffic within these areas and provide alerts in case of any unauthorized entry or exit. The solution also provides historical data on vessel movements, allowing the client to analyze traffic patterns, optimize their operations accordingly, and improve safety in the area.',
                            ),
                            CsCard(
                              title: 'PT Kita Hokki',
                              img: 'assets/images/kitahoki.png',
                              desc:
                                  'Natuna Global helped our client build a monitoring dashboard for their existing hardware to track the performance of their production line. We provided a solution by developing a monitoring system dashboard that could integrate with the clients existing hardware devices. Our team designed a custom software application that collected data from the devices and displayed it in real-time on a web-based dashboard. The dashboard provides our client with insights into the performance of their production line, allowing them to identify and address issues in real-time. By having a centralized system to monitor their hardware devices, the client was able to make data-driven decisions that optimized their operations.',
                            ),
                            CsCard(
                              title: 'PT Alfa Kencana Samudra',
                              img: 'assets/images/alfa.png',
                              desc:
                                  'Alfa Kencana Samudra needed to enhance their Vessel Tracking System to provide more accurate and real-time data on their vessels locations, routes, and weather forecast. Our team provided the 1Wave Application to develop a custom software solution that integrated well with their existing vessel tracking tools. They were able to improve their vessel tracking and management capabilities without having to invest in new tools or hardware. The new software features allowed them to track their vessels more accurately and optimize their operations for greater safety.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleCs(size),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final newScrollOff =
                            scrollController.offset - (details.delta.dx * 2);
                        scrollController.jumpTo(newScrollOff);
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CsCard(
                              title: 'Korpolairud Baharkam Polri',
                              img: 'assets/images/polairud.png',
                              desc:
                                  'Natuna Global being a technology partner who could understand its business needs, develop a scalable and user-friendly application, and provide ongoing support and maintenance. DMS Project aimed to improve database, vessel and aircraft management system of Korpolairud Baharkam Polri, it has several function, include: Data visualization, Performance monitoring, Resource allocation, Risk management, Communication and collaboration.',
                            ),
                            CsCard(
                              title: 'PT IPC Terminal Petikemas',
                              img: 'assets/images/pelindo.png',
                              desc:
                                  'We developed a custom software application that collects data from AIS and displays it in real-time on a web-based dashboard. The dashboard provides the client with insights into the performance of their vessels and other maritime traffic, allowing them to identify and address issues in real-time. The solution we provided also includes geofencing capabilities, allowing the client to set up virtual boundaries around specific areas of the port. This enables them to monitor vessel traffic within these areas and provide alerts in case of any unauthorized entry or exit. The solution also provides historical data on vessel movements, allowing the client to analyze traffic patterns, optimize their operations accordingly, and improve safety in the area.',
                            ),
                            CsCard(
                              title: 'PT Kita Hokki',
                              img: 'assets/images/kitahoki.png',
                              desc:
                                  'Natuna Global helped our client build a monitoring dashboard for their existing hardware to track the performance of their production line. We provided a solution by developing a monitoring system dashboard that could integrate with the clients existing hardware devices. Our team designed a custom software application that collected data from the devices and displayed it in real-time on a web-based dashboard. The dashboard provides our client with insights into the performance of their production line, allowing them to identify and address issues in real-time. By having a centralized system to monitor their hardware devices, the client was able to make data-driven decisions that optimized their operations.',
                            ),
                            CsCard(
                              title: 'PT Alfa Kencana Samudra',
                              img: 'assets/images/alfa.png',
                              desc:
                                  'Alfa Kencana Samudra needed to enhance their Vessel Tracking System to provide more accurate and real-time data on their vessels locations, routes, and weather forecast. Our team provided the 1Wave Application to develop a custom software solution that integrated well with their existing vessel tracking tools. They were able to improve their vessel tracking and management capabilities without having to invest in new tools or hardware. The new software features allowed them to track their vessels more accurately and optimize their operations for greater safety.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleCs(size),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final newScrollOff =
                            scrollController.offset - (details.delta.dx * 2);
                        scrollController.jumpTo(newScrollOff);
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CsCard(
                              title: 'Korpolairud Baharkam Polri',
                              img: 'assets/images/polairud.png',
                              desc:
                                  'Natuna Global being a technology partner who could understand its business needs, develop a scalable and user-friendly application, and provide ongoing support and maintenance. DMS Project aimed to improve database, vessel and aircraft management system of Korpolairud Baharkam Polri, it has several function, include: Data visualization, Performance monitoring, Resource allocation, Risk management, Communication and collaboration.',
                            ),
                            CsCard(
                              title: 'PT IPC Terminal Petikemas',
                              img: 'assets/images/pelindo.png',
                              desc:
                                  'We developed a custom software application that collects data from AIS and displays it in real-time on a web-based dashboard. The dashboard provides the client with insights into the performance of their vessels and other maritime traffic, allowing them to identify and address issues in real-time. The solution we provided also includes geofencing capabilities, allowing the client to set up virtual boundaries around specific areas of the port. This enables them to monitor vessel traffic within these areas and provide alerts in case of any unauthorized entry or exit. The solution also provides historical data on vessel movements, allowing the client to analyze traffic patterns, optimize their operations accordingly, and improve safety in the area.',
                            ),
                            CsCard(
                              title: 'PT Kita Hokki',
                              img: 'assets/images/kitahoki.png',
                              desc:
                                  'Natuna Global helped our client build a monitoring dashboard for their existing hardware to track the performance of their production line. We provided a solution by developing a monitoring system dashboard that could integrate with the clients existing hardware devices. Our team designed a custom software application that collected data from the devices and displayed it in real-time on a web-based dashboard. The dashboard provides our client with insights into the performance of their production line, allowing them to identify and address issues in real-time. By having a centralized system to monitor their hardware devices, the client was able to make data-driven decisions that optimized their operations.',
                            ),
                            CsCard(
                              title: 'PT Alfa Kencana Samudra',
                              img: 'assets/images/alfa.png',
                              desc:
                                  'Alfa Kencana Samudra needed to enhance their Vessel Tracking System to provide more accurate and real-time data on their vessels locations, routes, and weather forecast. Our team provided the 1Wave Application to develop a custom software solution that integrated well with their existing vessel tracking tools. They were able to improve their vessel tracking and management capabilities without having to invest in new tools or hardware. The new software features allowed them to track their vessels more accurately and optimize their operations for greater safety.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Column titleCs(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeInDown(
          child: Text(
            '__ CASE STUDIES',
            style: titleTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width > 1200 ? 20 : 14,
            ),
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 20 : 15,
        ),
        FadeInUp(
          child: Text(
            'DISCOVER',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width > 1200 ? 50 : 32,
            ),
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 25 : 20,
        ),
        FadeInRight(
          child: Text(
            'Our innovative solutions have helped businesses succeed. Read our fulfilling study cases and learn how we work among them',
            style: subtitleTextStyle.copyWith(
              fontSize: size.width > 1200 ? 18 : 14,
            ),
          ),
        ),
      ],
    );
  }
}
