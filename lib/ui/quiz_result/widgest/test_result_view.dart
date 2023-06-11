import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/utils/icons.dart';

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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.C_162023,
        border: Border.all(
          width: 1,
          color: AppColors.C_2F3739,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.progressBar),
          const SizedBox(width: 20),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Congratulations! You have ",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                          fontSize: 16,
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
