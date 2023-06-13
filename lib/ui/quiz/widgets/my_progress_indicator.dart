import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key? key, required this.rate}) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child:  SizedBox(
        height: 8,
        child: LinearProgressIndicator(
          value: rate, // percent filled
          valueColor:
          const AlwaysStoppedAnimation<Color>(AppColors.C_0E81B4),
          backgroundColor: AppColors.C_162023,
        ),
      ),
    );
  }
}
