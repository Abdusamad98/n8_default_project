import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding:  EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.C_0E81B4,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.timerLeft),
                 SizedBox(height: 4.h),
                Text(
                  getMinutelyText(passedTime),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                      ),
                ),
                Text(
                  "Total time",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          ),
        ),
         SizedBox(width: 16.w),
        Expanded(
          child: Container(
            padding:  EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.C_F2954D,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.timerRight),
                 SizedBox(height: 4.h),
                Text(
                  getMinutelyText(passedTime ~/ totalQuestionsCount),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                      ),
                ),
                Text(
                  "Avg. Time / Answer",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
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
