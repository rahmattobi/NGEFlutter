import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nge/widget/btn_title.dart';

import '../theme.dart';

class FormCs extends StatelessWidget {
  const FormCs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            child: Text(
              'Send us a Massage :',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInLeft(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Your Company',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            child: TextField(
              // controller: _textEditingController,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              // controller: _textEditingController,
              maxLines: 4,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Type Your Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInUp(
            child: BtnTitle(
              pdHorizontal: 40,
              pdVertical: 25,
              fontSize: 16,
              title: 'Send Message',
              url: '',
            ),
          ),
        ],
      ),
    );
  }
}
