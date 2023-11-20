import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:nge/pages/blogpage.dart';
import 'package:nge/pages/clientpage.dart';
import 'package:nge/pages/contactpage.dart';
import 'package:nge/pages/cspage.dart';
import 'package:nge/pages/homepage.dart';

import 'pages/aboutpage.dart';
import 'pages/blogdetailpage.dart';
import 'pages/productpage.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Natuna Global Ekapersada',
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/product': (context) => const ProductPage(),
        '/client': (context) => const ClientPage(),
        '/cs': (context) => CaseStudiesPage(),
        '/contact': (context) => const ContactPage(),
        '/blog': (context) => const BlogPage(),
        '/detail': (context) => BlogDetailPage(),
      },
    );
  }
}
