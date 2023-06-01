import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/on_boarding/on_boarding_screen.dart';
import 'package:n8_default_project/ui/widgets/app_logo.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.C_0001FC,
        elevation: 0,
      ),
      backgroundColor: AppColors.C_0001FC,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LATECH",
              style: TextStyle(
                  fontFamily: "PT-mono",
                  fontSize: 42,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
            ),
            const Text(
              "TECH MARKET",
              style: TextStyle(
                letterSpacing: 6,
                color: AppColors.white,
                fontFamily: "SF-Pro",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            SizedBox(height: height * (57 / 812)),
            AppLogo(
              screenHeight: height,
              width: width,
            ),
            SizedBox(height: height * (72 / 812)),
            GlobalButton(
                title: "Let's start",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const OnBoardingScreen();
                    }),
                  );
                }),
            SizedBox(height: height * (72 / 812)),
            const Text(
              "Skip for now",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.white,
                fontFamily: "SF-Pro",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
