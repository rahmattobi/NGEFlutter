import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class CsCard extends StatefulWidget {
  String? img;
  String? title;
  String? desc;
  CsCard({
    super.key,
    this.img,
    this.title,
    this.desc,
  });

  @override
  State<CsCard> createState() => _CsCardState();
}

class _CsCardState extends State<CsCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        // Mouse masuk, atur bayangan saat di-hover
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        // Mouse keluar, atur bayangan menjadi kosong
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        margin: EdgeInsets.all(size.width > 1200 ? 15 : 10),
        width: size.width > 1200
            ? size.width * 0.25
            : ((size.width >= 800 && size.width < 1200)
                ? size.width * 0.5
                : size.width * 0.6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Column(
          children: [
            FadeInUp(
              child: Container(
                height: size.width >= 800 ? 280 : 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.img.toString()),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(size.width >= 800 ? 30 : 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: Text(
                      widget.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: size.width >= 800 ? 20 : 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInDown(
                    child: Text(
                      widget.desc.toString(),
                      // overflow: TextOverflow.ellipsis,
                      style: subtitleTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: size.width >= 800 ? 15 : 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
