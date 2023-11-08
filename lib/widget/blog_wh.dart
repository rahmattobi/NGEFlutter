import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class BlogWidgetHome extends StatelessWidget {
  String? img;
  String? title;
  String? date;

  BlogWidgetHome({super.key, this.img, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: 450,
          width: screenWidth * 0.28,
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img.toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom:
              -10, // Mengatur posisi container judul di bagian bawah tumpukan
          left: -1,
          right: -1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: darkTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: subtitleColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        date.toString(),
                        style: subtitleTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
