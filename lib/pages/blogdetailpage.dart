import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nge/components/footer.dart';
import 'package:nge/helper/helper_class.dart';
import 'package:nge/theme.dart';

import '../components/contact_us.dart';
import '../components/menu_nav.dart';
import '../components/nav_desktop.dart';
import '../components/sosmed.dart';
import '../helper/blog.dart';
import '../helper/get_json.dart';
import '../widget/mobile_card.dart';

// ignore: must_be_immutable
class BlogDetailPage extends StatelessWidget {
  String? title;
  String? desc;
  final List<String>? gallery;
  final BlogService blogService = BlogService();

  BlogDetailPage({Key? key, this.title, this.desc, this.gallery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<Widget> imageSliders = gallery!
        .map(
          (item) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: subtitleColor.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 3)),
              ],
            ),
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: item.isEmpty
                  ? null
                  : Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: size.width,
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
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: titleBlog(
                        size,
                        title.toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInRight(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.3,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: descBlog(
                          size,
                          desc.toString(),
                        ),
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
                      height: 10,
                    ),
                    FutureBuilder(
                      future: blogService.readJsonData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
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
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Blog blog = blogDataList[index];

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
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
                                  ],
                                );
                              });
                        }
                      },
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
                        title.toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeInRight(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.3,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: descBlog(
                          size,
                          desc.toString(),
                        ),
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
                      height: 10,
                    ),
                    FutureBuilder(
                      future: blogService.readJsonData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
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
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Blog blog = blogDataList[index];

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BlogDetailPage(
                                            title: blog.title,
                                            desc: blog.desc,
                                            gallery: blog.galery,
                                          ),
                                        ));
                                      },
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: RecentPost(
                                          img: blog.img.toString(),
                                          title: blog.title.toString(),
                                          desc: blog.desc.toString(),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
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
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 60,
                  right: 60.0,
                ),
                child: FadeInDown(
                  child: titleBlog(
                    size,
                    title.toString(),
                  ),
                ),
              ),
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
                            height: 50,
                          ),
                          FadeInUp(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: descBlog(
                                size,
                                desc.toString(),
                              ),
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
                                fontSize: 25,
                                fontWeight: semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FutureBuilder(
                              future: blogService.readJsonData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
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
                                  List<Blog> blogDataList =
                                      snapshot.data as List<Blog>;

                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        Blog blog = blogDataList[index];

                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogDetailPage(
                                                    title: blog.title,
                                                    desc: blog.desc,
                                                    gallery: blog.galery,
                                                  ),
                                                ));
                                              },
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: Container(
                                                  width: size.width,
                                                  margin: const EdgeInsets.only(
                                                    bottom: 30,
                                                  ),
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 10,
                                                        color: subtitleColor
                                                            .withOpacity(0.3),
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      FadeInLeft(
                                                        child: Container(
                                                          width: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                blog.img
                                                                    .toString(),
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 20,
                                                            left: 10,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FadeInUp(
                                                                child: Text(
                                                                  blog.title
                                                                      .toString(),
                                                                  style: primaryTextStyle
                                                                      .copyWith(
                                                                    fontWeight:
                                                                        semiBold,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              FadeInDown(
                                                                child: Text(
                                                                  desc.toString(),
                                                                  style: subtitleTextStyle
                                                                      .copyWith(
                                                                    fontWeight:
                                                                        medium,
                                                                  ),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              },
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
        fontSize: size.width > 1200
            ? 35
            : (size.width > 800 && size.width < 1200 ? 32 : 24),
      ),
    );
  }

  Text descBlog(Size size, String desc) {
    return Text(
      desc,
      style: subtitleTextStyle.copyWith(
        fontWeight: medium,
        fontSize: size.width > 800 ? 20 : 15,
      ),
    );
  }
}
