import 'package:flutter/material.dart';

import '../helper/helper_class.dart';
import '../theme.dart';

class NavTablet extends StatelessWidget {
  const NavTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: EdgeInsets.all(HelperClass.mobileScreen(context) ? 8.0 : 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/natuna2.png',
                width: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  // Fungsi yang akan dijalankan saat tombol ditekan
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                      // Memberikan efek shadow saat tombol di-hover
                      return states.contains(MaterialState.hovered) ? 8 : 0;
                    },
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.line_style_outlined,
                      color: primaryColor,
                    ), // Gantilah dengan ikon yang diinginkan
                    const SizedBox(
                        width: 10), // Memberikan ruang antara ikon dan teks
                    Text(
                      'INQUIRY',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      centerTitle: false,
    );
  }
}
