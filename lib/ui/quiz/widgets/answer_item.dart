import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/utils/colors.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    Key? key,
    required this.variantName,
    required this.answerText,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String variantName;
  final String answerText;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.C_0E81B4 : AppColors.C_273032,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding:  EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
        title: Row(
          children: [
            Text(
              variantName,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
             SizedBox(width: 12.w),
            Expanded(
              child: Text(
                answerText,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
