import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../../utils/colors.dart';

class ResultCountView extends StatelessWidget {
  const ResultCountView({
    Key? key,
    required this.countFalse,
    required this.countTrue,
  }) : super(key: key);

  final int countTrue;
  final int countFalse;

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
              color: AppColors.C_27AE60,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$countTrue",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                ),
                Text(
                  "Correct answers",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
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
              color: AppColors.C_EB5757,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$countFalse",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                ),
                Text(
                  "Wrong answers",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
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
