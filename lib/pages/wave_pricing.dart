import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/helper_class.dart';
import '../theme.dart';

class WavePricing extends StatelessWidget {
  const WavePricing({super.key});

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
                  automaticallyImplyLeading: true,
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
                  automaticallyImplyLeading: true,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 30,
                    ),
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: 'onVm-L4BZjs',
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(child: pricePlan(size)),
                    const SizedBox(
                      height: 30,
                    ),
                    paket(size, 'FREE TRIAL', '0', ' /montly', 7, titleColor,
                        'https://1wave.world/maritime/maps/live', 'TRY NOW'),
                    const SizedBox(
                      height: 20,
                    ),
                    paket(size, 'BASIC', 'IDR 300K', ' /montly', 15,
                        dangerColor, '#', 'REQUEST DEMO'),
                    const SizedBox(
                      height: 20,
                    ),
                    paket(size, 'ADVANCED', 'To be Discuss', '', 19,
                        successColor, '#', 'REQUEST DEMO'),
                    const SizedBox(
                      height: 20,
                    ),
                    paket(size, 'APP SUITE', 'To be Discuss', '', 23, darkColor,
                        '#', 'REQUEST DEMO'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 30,
                    ),
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId:
                            'onVm-L4BZjs&t=2s&ab_channel=NatunaGlobalEkapersada%2CPT',
                        flags: const YoutubePlayerFlags(
                          autoPlay: true,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    pricePlan(size),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        paket(
                            size,
                            'FREE TRIAL',
                            '0',
                            ' /montly',
                            7,
                            titleColor,
                            'https://1wave.world/maritime/maps/live',
                            'TRY NOW'),
                        paket(size, 'BASIC', 'IDR 300K', ' /montly', 15,
                            dangerColor, '#', 'REQUEST DEMO'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        paket(size, 'ADVANCED', 'To be Discuss', '', 19,
                            successColor, '#', 'REQUEST DEMO'),
                        paket(size, 'APP SUITE', 'To be Discuss', '', 23,
                            darkColor, '#', 'REQUEST DEMO'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleProduct(size),
                    const SizedBox(
                      height: 30,
                    ),
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId:
                            'onVm-L4BZjs&t=2s&ab_channel=NatunaGlobalEkapersada%2CPT',
                        flags: const YoutubePlayerFlags(
                          autoPlay: true,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    pricePlan(size),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        paket(
                            size,
                            'FREE TRIAL',
                            '0',
                            ' /montly',
                            7,
                            titleColor,
                            'https://1wave.world/maritime/maps/live',
                            'TRY NOW'),
                        const SizedBox(
                          width: 10,
                        ),
                        paket(size, 'BASIC', 'IDR 300K', ' /montly', 15,
                            dangerColor, '#', 'REQUEST DEMO'),
                        const SizedBox(
                          width: 10,
                        ),
                        paket(size, 'ADVANCED', 'To be Discuss', '', 19,
                            successColor, '#', 'REQUEST DEMO'),
                        const SizedBox(
                          width: 10,
                        ),
                        paket(size, 'APP SUITE', 'To be Discuss', '', 23,
                            darkColor, '#', 'REQUEST DEMO'),
                        const SizedBox(
                          width: 10,
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
      ),
    );
  }

  Column titleProduct(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '__ ASSETS MONITORING',
          style: titleTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: (size.width >= 800 && size.width < 1200) ? 20 : 14,
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 20 : 15,
        ),
        Text(
          '1WAVE',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: (size.width >= 800 && size.width < 1200) ? 50 : 32,
          ),
        ),
      ],
    );
  }

  Column pricePlan(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '___ PRICE & PLAN ___',
          style: titleTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: (size.width >= 800 && size.width < 1200) ? 20 : 15,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Choose Your Plan',
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: (size.width >= 800 && size.width < 1200) ? 35 : 24,
          ),
        )
      ],
    );
  }

  Container paket(
    Size size,
    String title,
    String type,
    String type2,
    int indx,
    Color color,
    String url,
    String label,
  ) {
    List<String> features = [
      'Real-time Ship Tracking',
      'Vessel Information',
      'Track Tails',
      'Track Predictor',
      'Range Indicator',
      'Geofencing',
      'Geofencing',
      'Traffic Alerts',
      'Weather Forecasts',
      'Weather Data',
      'GPS Data Record',
      'GPS Data Export',
      'Multi Map',
      'Multi User',
      'API',
      'AIS Data Integration',
      'Custom Alerts',
      'White Label',
      'Dedicated Server',
      'Custom domain and SSL Certificate',
      'Technical Support',
      'Advanced Analytics',
      'Customize Feature',
      'Full Ownership and Control',
    ];
    return Container(
      width: size.width > 1200
          ? size.width * 0.2
          : ((size.width >= 800 && size.width < 1200)
              ? size.width * 0.45
              : size.width),
      height: size.width >= 800 ? 1150 : 900,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: subtitleColor.withOpacity(0.2),
          ),
          right: BorderSide(
            width: 1,
            color: subtitleColor.withOpacity(0.2),
          ),
          bottom: BorderSide(
            width: 1,
            color: subtitleColor.withOpacity(0.2),
          ),
          top: BorderSide(
            width: 3,
            color: color,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: subtitleTextStyle.copyWith(
                fontSize: size.width >= 800 ? 20 : 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: type,
                    style: primaryTextStyle.copyWith(
                      fontSize: size.width >= 800 ? 30 : 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  TextSpan(
                    text: type2,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: size.width >= 800 ? 18 : 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: size.width >= 800 ? 17 : 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox.expand(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    Color itemColor = index > indx
                        ? subtitleColor.withOpacity(0.3)
                        : subtitleColor;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        features[index],
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: itemColor,
                          fontSize: size.width >= 800 ? 16 : 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: () {
                launch(url);
              },
              label: Text(
                label,
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 15,
                ),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: size.width >= 800 ? 20 : 10,
                    horizontal: size.width >= 800 ? 35 : 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
