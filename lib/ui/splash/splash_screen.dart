import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/welcome/welcome_screen.dart';
import 'package:n8_default_project/ui/widgets/app_logo.dart';
import 'package:n8_default_project/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("BUILD CALLED ONCE");

    _navigateToWelcomeScreen(context);

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
          ],
        ),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const WelcomeScreen();
          },
        ),
      );
    });
  }
}
