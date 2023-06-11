import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/models/subject_model.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import 'my_progress_indicator.dart';


class QuizScreenTop extends StatelessWidget {
  const QuizScreenTop({Key? key, required this.rate, required this.subjectName, required this.height, required this.timeText}) : super(key: key);

  final double rate;
  final String subjectName;
  final double height;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: height * 0.125,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chapter text",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Text(
                "$subjectName chapter",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.textColor.withOpacity(0.5)),
              ),
              const Spacer(),
              SvgPicture.asset(
                AppImages.clock,
              ),
              const SizedBox(width: 8),
              Text(
                timeText,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.textColor),
              ),
            ],
          ),
          const SizedBox(height: 7),
          MyProgressIndicator(rate: rate),
        ],
      ),
    )
    ;
  }
}
