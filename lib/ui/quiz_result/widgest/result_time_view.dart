import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/icons.dart';
import 'package:n8_default_project/utils/utility_functions.dart';

import '../../../utils/colors.dart';

class ResultTimeView extends StatelessWidget {
  const ResultTimeView({
    Key? key,
    required this.totalQuestionsCount,
    required this.passedTime,
  }) : super(key: key);


  final int passedTime;
  final int totalQuestionsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.C_0E81B4,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.timerLeft),
                const SizedBox(height: 4),
                Text(
                  getMinutelyText(passedTime),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16,
                      ),
                ),
                Text(
                  "Total time",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.C_F2954D,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.timerRight),
                const SizedBox(height: 4),
                Text(
                  getMinutelyText(passedTime ~/ totalQuestionsCount),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16,
                      ),
                ),
                Text(
                  "Avg. Time / Answer",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
