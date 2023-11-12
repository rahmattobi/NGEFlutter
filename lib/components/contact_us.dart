import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          child: Text(
            'CONTACT US',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FadeInUp(
          child: Text(
            'HEAD OFFICE',
            style: whiteTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInDown(
          child: SelectableText(
            'EduCenter Building Lt. 2A Unit 22592, Jl. Sekolah Foresta No. 8, BSD City - Banten 15331,\nIndonesia',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInUp(
          child: Text(
            'CORPORATE OFFICE',
            style: whiteTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInDown(
          child: SelectableText(
            'Jl. Boulevard Europa No.10 RT.001/RW.009, Panunggangan Barat, Kec. Cibodas, Kota Tangerang,\nBanten 15138 Indonesia',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FadeInDown(
          child: SelectableText(
            '+62 21 508 862 05',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 05,
        ),
        FadeInUp(
          child: SelectableText(
            'info@natuna.global',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
