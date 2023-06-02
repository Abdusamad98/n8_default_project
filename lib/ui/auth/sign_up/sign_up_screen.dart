import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/auth/login/login_screen.dart';
import 'package:n8_default_project/ui/auth/sign_up/widgets/universal_input.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';

import '../../../utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.C_0001FC,
        elevation: 0,
      ),
      backgroundColor: AppColors.C_0001FC,
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Create an account",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.white,
                fontFamily: "SF-Pro",
              ),
            ),
          ),
          SizedBox(height: height * 127 / 812),
          UniversalInput(
            title: "Full Name",
            hintText: "Full Name",
            type: TextInputType.text,
          ),
          const SizedBox(height: 24),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              }),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "Already have an account ? Login",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.C_FBDF00,
                fontFamily: "SF-Pro",
              ),
            ),
          )
        ],
      ),
    );
  }
}
