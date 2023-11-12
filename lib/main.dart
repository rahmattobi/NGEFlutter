import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
// import 'package:nge/components/drawer_navbar.dart';
import 'package:nge/pages/homepage.dart';

// void main() {
//   runApp(const MyApp());
// }

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
      title: 'Natuna Global Ekapersada',
      // home: const DrawerNavbar(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
