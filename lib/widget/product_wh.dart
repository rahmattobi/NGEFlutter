import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class ProductWidgetHome extends StatelessWidget {
  String? img;
  String? judul;
  String? desc;
  final Alignment alignment;

  ProductWidgetHome(
      {super.key, this.img, this.judul, this.desc, required this.alignment});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: alignment, // Atur Alignment
      margin: const EdgeInsets.only(bottom: 50),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width >= 800 ? 60 : 30),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              img.toString(),
              height: MediaQuery.of(context).size.width >= 800 ? 100 : 80,
            ),
            const SizedBox(height: 20),
            Text(
              judul.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width >= 800 ? 30 : 20,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                desc.toString(),
                style: whiteTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: MediaQuery.of(context).size.width >= 800 ? 16 : 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
