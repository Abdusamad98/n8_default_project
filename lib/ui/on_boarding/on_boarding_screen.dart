import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/on_boarding/widgets/center_dots.dart';
import 'package:n8_default_project/ui/on_boarding/widgets/page_content.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../utils/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.C_0001FC,
        elevation: 0,
      ),
      backgroundColor: AppColors.C_0001FC,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                PageContent(
                  imagePath: AppImages.illustration1,
                  title: "The best tech market",
                  height: height,
                  imageHeight: 268,
                ),
                PageContent(
                  imagePath: AppImages.illustration2,
                  title: "A lot of exclusives",
                  height: height,
                  imageHeight: 450,
                ),
                PageContent(
                  imageHeight: 410,
                  imagePath: AppImages.illustration3,
                  title: "Sales all the time",
                  height: height,
                ),
              ],
            ),
          ),
          SizedBox(height: height * (40 / 812)),
          const CenterDots(activeDotIndex: 2),
          SizedBox(height: height * (40 / 812)),
          const Text(
            "Next",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.white,
              fontFamily: "SF-Pro",
            ),
          ),
          SizedBox(height: height * (40 / 812)),
        ],
      ),
    );
  }
}
