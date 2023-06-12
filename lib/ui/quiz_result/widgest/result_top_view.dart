import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ResultTopView extends StatelessWidget {
  const ResultTopView({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.C_162023,
        border: Border.all(
          width: 1,
          color: AppColors.C_2F3739,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,

                  ),
            ),
            const SizedBox(height: 7),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.textColor.withOpacity(0.5)
              ),

            ),
          ],
        ),
      ),
    );
    ;
  }
}
