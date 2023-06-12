import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key, required this.timeText}) : super(key: key);

  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 94,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.textColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.clock,
          ),
          const SizedBox(width: 5),
          Text(
            timeText,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
