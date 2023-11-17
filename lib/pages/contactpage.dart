import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/widget/btn_title.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/helper_class.dart';
import '../theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleContact(size),
                    const SizedBox(
                      height: 20,
                    ),
                    address(size),
                    const SizedBox(
                      height: 20,
                    ),
                    phone(size),
                    const SizedBox(
                      height: 20,
                    ),
                    hours(size),
                    const SizedBox(
                      height: 50,
                    ),
                    form(size),
                    const SizedBox(
                      height: 30,
                    ),
                    // MapboxMap(initialCameraPosition: ),
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
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleContact(size),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            address(size),
                            const SizedBox(
                              height: 20,
                            ),
                            phone(size),
                            const SizedBox(
                              height: 20,
                            ),
                            hours(size),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: form(size),
                        ),
                      ],
                    ),

                    // MapboxMap(initialCameraPosition: ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
        desktop: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleContact(size),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            address(size),
                            const SizedBox(
                              height: 20,
                            ),
                            phone(size),
                            const SizedBox(
                              height: 20,
                            ),
                            hours(size),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: form(size),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Column titleContact(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeInDown(
          child: Text(
            '__ CONTACT US',
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
            'DISCUSS',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width > 1200 ? 50 : 32,
            ),
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 25 : 15,
        ),
        FadeInRight(
          child: Text(
            'Your dream project with us',
            style: subtitleTextStyle.copyWith(
              fontSize: size.width > 1200 ? 18 : 16,
            ),
          ),
        ),
      ],
    );
  }

  Container address(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width > 1200 ? 40 : 20),
      width: size.width >= 800 ? size.width * 0.3 : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: subtitleColor.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          FadeInUp(
            child: Image.asset(
              'assets/images/address.png',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            child: Text(
              'Address',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: Text(
              'Head Office',
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInLeft(
            child: Text(
              'EduCenter Building Lt. 2A Unit 22592, Jl. Sekolah Foresta No. 8, BSD City - Banten 15331, Indonesia',
              style: subtitleTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInRight(
            child: Text(
              'Corporate Office',
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInDown(
            child: Text(
              'Jl. Boulevard Europa No.10 RT.001/RW.009, Panunggangan Barat, Kec. Cibodas, Kota Tangerang, Banten 15138 Indonesia',
              style: subtitleTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Container phone(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width > 1200 ? 40 : 20),
      width: size.width >= 800 ? size.width * 0.3 : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: subtitleColor.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          FadeInDown(
            child: Image.asset(
              'assets/images/phone.png',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInLeft(
            child: Text(
              'Phone Number',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInRight(
            child: Text(
              '+62 21 508 862 05',
              style: subtitleTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Container hours(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width > 1200 ? 40 : 20),
      width: size.width >= 800 ? size.width * 0.3 : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: subtitleColor.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          FadeInUp(
            child: Image.asset(
              'assets/images/time.png',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInLeft(
            child: Text(
              'Opening Hours',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            child: Text(
              'Monday - Friday',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInDown(
            child: Text(
              '08:00 AM - 17:00 PM',
              style: subtitleTextStyle.copyWith(
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox form(Size size) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            child: Text(
              'Send us a Massage :',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInLeft(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Your Company',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              // controller: _textEditingController,
              maxLines: 4,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Type Your Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInUp(
            child: BtnTitle(
              pdHorizontal: 40,
              pdVertical: 25,
              fontSize: 16,
              title: 'Send Message',
              url: '',
            ),
          ),
        ],
      ),
    );
  }
}
