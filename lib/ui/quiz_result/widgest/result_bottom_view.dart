import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../widgets/global_button.dart';

class ResultBottomView extends StatelessWidget {
  const ResultBottomView({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 32.w),
      height: 80.h,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        color: AppColors.C_162023,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Next Chapter:\n",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: "Quadratic Equations",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                      ),
                ),
              ],
            ),
          ),
           SizedBox(width: 32.w),
          SizedBox(
            width: 50.w,
            child: GlobalButton(
              title: "Go",
              onTap: onTap,
              color: AppColors.C_0E81B4,
            ),
          )
        ],
      ),
    );
  }
}
