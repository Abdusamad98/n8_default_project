import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class QuizAppBar extends StatelessWidget implements PreferredSize {
  const QuizAppBar({
    Key? key,
    required this.onTap,
    required this.title,
    required this.onSubmitTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final VoidCallback onSubmitTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      title: Column(
        children: [
           SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 48.w,
                  width: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.C_162023,
                      border: Border.all(color: AppColors.C_2F3739)),
                  child: Center(
                    child: SvgPicture.asset(AppImages.arrowBack),
                  ),
                ),
              ),
               SizedBox(width: 16.w),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18.sp),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onSubmitTap,
                child: Container(
                  padding:  EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      color: AppColors.C_0E81B4,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.textColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
