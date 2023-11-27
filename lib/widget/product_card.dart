import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'btn_title.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  String? img;
  String? type;
  String? judul;
  String? desc;
  String? url;

  ProductCard({
    super.key,
    this.img,
    this.type,
    this.judul,
    this.desc,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width >= 800 ? size.width * 1 / 3.5 : size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FadeInLeft(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    img.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInRight(
            child: Text(
              type.toString(),
              style: titleTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: size.width > 1200 ? 14 : 12,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            child: Text(
              judul.toString(),
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: size.width > 1200 ? 30 : 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInLeft(
            child: Text(
              desc.toString(),
              style: subtitleTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: size.width > 1200 ? 40 : 20,
          ),
          BtnTitle(
            pdHorizontal: size.width > 1200 ? 40 : 25,
            pdVertical: size.width > 1200 ? 25 : 20,
            fontSize: size.width > 1200 ? 14 : 12,
            title: 'READ MORE',
            url: url.toString(),
          )
        ],
      ),
    );
  }
}
