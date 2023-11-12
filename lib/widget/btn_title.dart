import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class BtnTitle extends StatelessWidget {
  double pdHorizontal;
  double pdVertical;
  double fontSize;
  String title;
  final String url;

  BtnTitle(
      {super.key,
      required this.pdHorizontal,
      required this.pdVertical,
      required this.fontSize,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return titleDarkColor; // Warna latar belakang saat tombol di-hover
              }
              return titleColor; // Warna latar belakang saat tidak di-hover
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Atur border radius ke 20
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              horizontal: pdHorizontal,
              vertical: pdVertical,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, url);
        },
        child: Text(
          title,
          style: titleTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: fontSize,
            letterSpacing: 2,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
