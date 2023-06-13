import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/colors.dart';

class TestResultView extends StatelessWidget {
  const TestResultView({
    Key? key,
    required this.totalQuestionCount,
    required this.trueAnswersCount,
  }) : super(key: key);

  final int totalQuestionCount;
  final int trueAnswersCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.C_162023,
        border: Border.all(
          width: 1,
          color: AppColors.C_2F3739,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            circularStrokeCap: CircularStrokeCap.round,
            reverse: true,
            radius: 55.0.r,
            lineWidth: 8.0,
            animation: true,
            animationDuration: 1000,
            percent: trueAnswersCount / totalQuestionCount,
            center: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "$trueAnswersCount",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: "/$totalQuestionCount\nyour score",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppColors.textColor.withOpacity(0.75)),
                  ),
                ],
              ),
            ),
            progressColor: AppColors.C_0E81B4,
            backgroundColor: AppColors.C_0E81B4.withOpacity(0.4),
          ),

          //SvgPicture.asset(AppImages.progressBar),
           SizedBox(width: 20.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Congratulations! You have ",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                children: <TextSpan>[
                  ((trueAnswersCount / totalQuestionCount) * 100) >= 60
                      ? TextSpan(
                          text: "passed",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.C_6FCF97),
                        )
                      : TextSpan(
                          text: "failed",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.C_EB5757),
                        ),
                  TextSpan(
                    text: " this test with ",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                  ),
                  TextSpan(
                    text:
                        "${((trueAnswersCount / totalQuestionCount) * 100).toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.C_0E81B4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
