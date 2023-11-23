import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/pages/blogdetailpage.dart';
import 'package:nge/widget/mobile_card.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/blog.dart';
import '../helper/helper_class.dart';
import '../theme.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<Blog> blogDataList = [];

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
        mobile: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
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
                    // Article Content
                    buildListView('blog', size),

                    // Activity Content
                    buildListView('activity', size),
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
                  top: 20.0,
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
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/detail');
                                  },
                                  child: MobileCard(
                                    img: 'assets/images/bg2.jpg',
                                    title:
                                        'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                    desc:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit. Arcu cursus vitae congue mauris rhoncus aenean. Eros in cursus turpis massa tincidunt dui ut ornare lectus. ',
                                  ),
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
                                return MobileCard(
                                  img: 'assets/images/bann.jpg',
                                  title:
                                      'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                  desc:
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
                                return MobileCard(
                                  img: 'assets/images/bg2.jpg',
                                  title:
                                      'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                  desc:
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
                                return MobileCard(
                                  img: 'assets/images/bg2.jpg',
                                  title:
                                      'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum',
                                  desc:
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

  Future<List<Blog>> readJsonData() async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/data.json');
      final List<dynamic> jsonList = json.decode(jsonData) as List<dynamic>;

      return jsonList
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (error) {
      print('Error reading JSON data: $error');
      return []; // Return an empty list or handle the error as needed
    }
  }

  Future<void> fetchData() async {
    List<Blog> data = await readJsonData();
    setState(() {
      blogDataList = data;
    });
  }

  Widget buildListView(String type, Size size) {
    return FutureBuilder(
      future: readJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'Data Kosong',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          );
        } else {
          List<Blog> blogDataList = snapshot.data as List<Blog>;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: blogDataList.length + 1,
            primary: false,
            itemBuilder: (context, index) {
              if (index == blogDataList.length) {
                // Ini adalah bagian untuk footer
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Footer(),
                );
              } else {
                // Ini adalah bagian untuk item
                Blog blog = blogDataList[index];

                // Filter sesuai dengan tipe ('blog' atau 'activity')
                if (blog.type == type) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlogDetailPage(
                            title: blog.title,
                            desc: blog.desc,
                            gallery: blog.galery,
                          ),
                        ));
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: MobileCard(
                          img: blog.img.toString(),
                          title: blog.title.toString(),
                          desc: blog.desc.toString(),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          );
        }
      },
    );
  }
}
