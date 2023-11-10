import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff171151);
Color subtitleColor = const Color(0xff8789A3);
Color titleColor = const Color(0xff0d6efd);
Color titleDarkColor = const Color.fromARGB(255, 7, 84, 200);
Color whiteColor = Colors.white;
Color darkColor = const Color(0xff000051);
Color successColor = const Color(0xff198754);
Color dangerColor = const Color(0xffDC3545);

TextStyle primaryTextStyle = TextStyle(
  color: primaryColor,
  fontFamily: "Montserrat",
  fontSize: 14,
);

TextStyle subtitleTextStyle = TextStyle(
  color: subtitleColor,
  fontSize: 14,
  fontFamily: "Montserrat",
);

TextStyle titleTextStyle = TextStyle(
  color: titleColor,
  fontFamily: "Montserrat",
  fontSize: 14,
);

TextStyle whiteTextStyle = TextStyle(
  color: whiteColor,
  fontFamily: "Montserrat",
  fontSize: 14,
);

TextStyle darkTextStyle = TextStyle(
  color: darkColor,
  fontFamily: "Montserrat",
  fontSize: 14,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;

double defaultMargin = 24;

class AppTheme {
  static MaterialButton customTextButton({
    required String text,
    required Color btnColor,
    required Color hvrColor,
    required Color txtBtnColor,
    required double horizontal,
    required FontWeight fontWeight,
    required VoidCallback onPressed,
    IconData? iconData,
  }) {
    return MaterialButton(
      height: 50,
      minWidth: 100,
      hoverColor: hvrColor,
      color: btnColor,
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: 25,
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.5,
      focusColor: darkColor,
      child: Row(
        children: [
          if (iconData != null)
            Icon(
              iconData,
              color: titleColor,
            ),
          if (iconData != null) const SizedBox(width: 8),
          Text(
            text,
            style: subtitleTextStyle.copyWith(
              fontWeight: fontWeight,
              color: txtBtnColor,
            ),
          ),
        ],
      ),
    );
  }
}
