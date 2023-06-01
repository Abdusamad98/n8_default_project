import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class PageContent extends StatelessWidget {
  const PageContent(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.height,
      required this.imageHeight})
      : super(key: key);

  final String imagePath;
  final String title;
  final double height;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
          height: height * imageHeight / 812,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.white,
            fontFamily: "SF-Pro",
          ),
        ),
      ],
    );
  }
}
