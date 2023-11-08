import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class ProductWidgetHome extends StatelessWidget {
  String? img;
  String? judul;
  String? desc;

  ProductWidgetHome({super.key, this.img, this.judul, this.desc});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.60),
          Image.asset(
            img.toString(),
            height: 100,
          ),
          const SizedBox(height: 40),
          Text(
            judul.toString(),
            style: whiteTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            desc.toString(),
            style: whiteTextStyle.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
