import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectImageView extends StatelessWidget {
  const SubjectImageView({Key? key, required this.iconPath}) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
