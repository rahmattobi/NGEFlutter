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
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img.toString(),
            height: 80,
          ),
          const SizedBox(height: 20),
          Text(
            judul.toString(),
            style: whiteTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Text(
              desc.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
