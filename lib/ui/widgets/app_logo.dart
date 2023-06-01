import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, required this.screenHeight, required this.width}) : super(key: key);

  final double screenHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 216 / 812,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.C_0001FC,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              spreadRadius: 50,
              blurRadius: 40,
              offset: Offset(-30, -20),
            ),
          ]),
      child: Center(
        child: SvgPicture.asset(AppImages.logo,width: width*(149/375),),
      ),
    );
  }
}
