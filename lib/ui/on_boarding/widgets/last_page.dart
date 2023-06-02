import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import 'login_with_button.dart';
import '../../widgets/global_button.dart';

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Connection",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.white,
            fontFamily: "SF-Pro",
          ),
        ),
        const Spacer(),
        GlobalButton(title: "Create an account", onTap: () {}),
        const SizedBox(height: 32),
        LoginWithButton(
          textColor: AppColors.C_555555,
          title: "Connect with Google",
          onTap: () {},
          icon: AppImages.google,
          color: AppColors.white,
        ),
        const SizedBox(height: 32),
        LoginWithButton(
          textColor:AppColors.white,
          title: "Connect with Facebook",
          onTap: () {},
          icon: AppImages.facebook,
          color: AppColors.C_415A93,
        ),
        const SizedBox(height: 32),
        const Text(
          "Already have an account ? Login",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: AppColors.C_FBDF00,
            fontFamily: "SF-Pro",
          ),
        )
      ],
    );
  }
}
