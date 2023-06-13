import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/models/answers_report.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/ui/quiz_result/result_report_screen.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/result_bottom_view.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/result_count_view.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/result_time_view.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/result_top_view.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/retry_button.dart';
import 'package:n8_default_project/ui/quiz_result/widgest/test_result_view.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';

import '../widgets/global_appbar.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({
    Key? key,
    required this.answersMap,
    required this.subjectModel, required this.passedTime,
  }) : super(key: key);

  final Map<int, int> answersMap;
  final SubjectModel subjectModel;
  final int passedTime;

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  late AnswersReport answersReport;

  @override
  void initState() {
    answersReport = AnswersReport(
      answersMap: widget.answersMap,
      questions: widget.subjectModel.questions,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Quiz Result",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w),
              children: [
                ResultTopView(
                  title: "Pair of Linear Equation in Two Variables ",
                  subTitle: "${widget.subjectModel.subjectName} /  Theme",
                ),
                 SizedBox(height: 19.h),
                TestResultView(
                  totalQuestionCount: widget.subjectModel.questions.length,
                  trueAnswersCount: answersReport.trueCount,
                ),
                 SizedBox(height: 19.h),
                ResultCountView(
                  countFalse:
                      answersReport.falseCount + answersReport.unselectedCount,
                  countTrue: answersReport.trueCount,
                ),
                 SizedBox(height: 19.h),
                 ResultTimeView(
                   passedTime: widget.passedTime,
                  totalQuestionsCount: widget.subjectModel.questions.length,
                ),
                 SizedBox(height: 19.h),
                GlobalButton(
                  title: "Check Answers",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultReportScreen(
                              answersReport: answersReport);
                        },
                      ),
                    );
                  },
                  color: AppColors.C_0E81B4.withOpacity(0.5),
                  withBorder: true,
                ),
                 SizedBox(height: 16.h),
                RetryButton(onTap: () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
          ResultBottomView(onTap: () {})
        ],
      ),
    );
  }
}
