import 'package:flutter/material.dart';

import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';

class BottomButtonViews extends StatelessWidget {
  const BottomButtonViews({
    Key? key,
    required this.onNextTap,
    required this.onPreviousTap,
    required this.onNextTapVisibility,
    required this.onPreviousTapVisibility,
  }) : super(key: key);

  final VoidCallback onNextTap;
  final bool onNextTapVisibility;
  final bool onPreviousTapVisibility;
  final VoidCallback onPreviousTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.C_162023,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width / 4,
            child: Visibility(
              visible: onPreviousTapVisibility,
              child: GlobalButton(
                  title: "Previous",
                  onTap: onPreviousTap,
                  color: AppColors.C_273032),
            ),
          ),
          SizedBox(
            width: width / 4,
            child: Visibility(
              visible: onNextTapVisibility,
              child: GlobalButton(
                  title: "Next", onTap: onNextTap, color: AppColors.C_0E81B4),
            ),
          ),
        ],
      ),
    );
  }
}
