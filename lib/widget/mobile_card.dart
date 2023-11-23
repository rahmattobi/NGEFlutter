import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class MobileCard extends StatelessWidget {
  String img;
  String title;
  String desc;

  MobileCard({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return size.width >= 800
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
                          textAlign: TextAlign.start,
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
            margin: const EdgeInsets.only(
              top: 20,
            ),
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
                      right: 20,
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
                              fontSize: 15,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FadeInDown(
                          child: Text(
                            desc,
                            style: subtitleTextStyle.copyWith(),
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
          );
  }
}
