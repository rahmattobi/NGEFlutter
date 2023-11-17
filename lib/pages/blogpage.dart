import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/helper_class.dart';
import '../theme.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          mobile: DefaultTabController(
            length: 2, // set the number of tabs\
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 30, right: 30, bottom: 10),
                  child: titleBlog(size),
                ),
                TabBar(
                  // isScrollable: true,
                  labelColor: titleColor,
                  labelStyle: subtitleTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                  tabs: const [
                    Tab(
                      text: 'ARTICLE',
                    ),
                    Tab(
                      text: 'ACTIVITY',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bann.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bann.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                ],
                              ),
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                      // Activity Content
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  mobileCard(
                                    size,
                                    'assets/images/bann.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bann.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                  mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
                                ],
                              ),
                            ),
                            const Footer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          tablet: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 30,
                    right: 30,
                    bottom: 10,
                  ),
                  child: titleBlog(size),
                ),
                TabBar(
                  labelColor: titleColor,
                  labelStyle: subtitleTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                  tabs: const [
                    Tab(text: 'ARTICLE'),
                    Tab(text: 'ACTIVITY'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: (size.width * 0.4) / 320,
                                ),
                                itemCount: 4, // Adjust the number of items
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  );
                                },
                              ),
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                      // Activity Content
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: (size.width * 0.4) / 320,
                                ),
                                itemCount: 4, // Adjust the number of items
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return mobileCard(
                                    size,
                                    'assets/images/bann.jpg',
                                    'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  );
                                },
                              ),
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          desktop: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 40,
                  ),
                  child: titleBlog(size),
                ),
                TabBar(
                  padding: const EdgeInsets.only(left: 60),
                  isScrollable: true,
                  labelColor: titleColor,
                  labelStyle: subtitleTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                  tabs: const [
                    Tab(text: 'ARTICLE'),
                    Tab(text: 'ACTIVITY'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 30,
                              ),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 60.0,
                                  childAspectRatio: (size.width * 0.4) / 520,
                                ),
                                itemCount: 4, // Adjust the number of items
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                      // Activity Content
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 30,
                              ),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 60.0,
                                  childAspectRatio: (size.width * 0.4) / 520,
                                ),
                                itemCount: 4, // Adjust the number of items
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return mobileCard(
                                    size,
                                    'assets/images/bg2.jpg',
                                    'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Footer(),
                          ],
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
    );
  }

  Column titleBlog(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeInDown(
          child: Text(
            "__ NATUNA'S UPDATED",
            style: titleTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width > 1200 ? 20 : 12,
            ),
          ),
        ),
        SizedBox(
          height: size.width > 1200 ? 20 : 15,
        ),
        FadeInUp(
          child: Text(
            'ARTICLE & ACTIVITY',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: size.width > 1200 ? 45 : 20,
            ),
          ),
        ),
      ],
    );
  }

  FadeInUp mobileCard(
    Size size,
    String img,
    String title,
    String desc,
  ) {
    return FadeInUp(
      duration: const Duration(seconds: 2),
      child: size.width >= 800
          ? Container(
              width: size.width,
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
              child: Column(
                children: [
                  FadeInLeft(
                    child: Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(img.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          child: Text(
                            title,
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 18,
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
                            desc,
                            style: subtitleTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(img.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInUp(
                            child: Text(
                              title,
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
                              desc,
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
    );
  }
}
