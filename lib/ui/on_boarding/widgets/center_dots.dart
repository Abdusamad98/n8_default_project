import 'package:flutter/material.dart';
import 'package:n8_default_project/utils/colors.dart';

class CenterDots extends StatelessWidget {
  const CenterDots({Key? key, required this.activeDotIndex}) : super(key: key);

  final int activeDotIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        if (activeDotIndex == index) {
          return activeDot();
        }
        return inActiveDot();
      }),
    );
  }

  Widget activeDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 7,
      height: 7,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
    );
  }

  Widget inActiveDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withOpacity(0.32),
      ),
    );
  }
}
