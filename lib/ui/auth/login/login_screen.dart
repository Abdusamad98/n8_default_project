import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/auth/sign_up/widgets/universal_input.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/widgets/app_logo.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';

import '../../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.white,
                fontFamily: "SF-Pro",
              ),
            ),
            SizedBox(height: height * 50 / 812),
            AppLogo(screenHeight: height, width: width),
            UniversalInput(
              title: "Email",
              hintText: "Email",
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            UniversalInput(
              title: "Password",
              hintText: "Password",
              type: TextInputType.text,
              isPassword: true,
            ),
            const SizedBox(height: 32),
            GlobalButton(
                title: "Validate",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }),
            const SizedBox(height: 40),
            const Text(
              "Don’t have an account? Sign-up",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.C_FBDF00,
                fontFamily: "SF-Pro",
              ),
            )
          ],
        ),
      ),
    );
  }
}
