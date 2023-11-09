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
  static TextButton customTextButton({
    required String text,
    required VoidCallback onPressed,
    IconData? iconData,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          whiteColor,
        ), // Ganti warna sesuai kebutuhan
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
        ),
        shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          // Set the shadow color for different states
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey.withOpacity(0.5); // Shadow color when pressed
          }
          return Colors.grey.withOpacity(0.2); // Default shadow color
        }),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          // Set the elevation (shadow) for different states
          if (states.contains(MaterialState.pressed)) {
            return 10; // Elevation when pressed
          }
          return 5; // Default elevation
        }),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Row(
        children: [
          if (iconData != null) Icon(iconData),
          const SizedBox(width: 8),
          Text(
            text,
            style: subtitleTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
