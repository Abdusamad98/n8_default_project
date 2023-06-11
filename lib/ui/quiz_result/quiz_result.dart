import 'package:flutter/material.dart';
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

import '../../models/question_model.dart';
import '../widgets/global_appbar.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({
    Key? key,
    required this.answersMap,
    required this.subjectModel,
  }) : super(key: key);

  final Map<int, int> answersMap;
  final SubjectModel subjectModel;

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
              padding: const EdgeInsets.all(30),
              children: [
                const ResultTopView(
                  title: "Pair of Linear Equation in Two Variables ",
                  subTitle: "Maths / Real Numbers",
                ),
                const SizedBox(height: 19),
                 TestResultView(
                  totalQuestionCount:widget.subjectModel.questions.length ,
                  trueAnswersCount: answersReport.trueCount,
                ),
                const SizedBox(height: 19),
                ResultCountView(
                  countFalse: answersReport.falseCount+answersReport.unselectedCount,
                  countTrue: answersReport.trueCount,
                ),
                const SizedBox(height: 19),
                const ResultTimeView(
                  totalQuestionsCount: 12,
                  totalTime: 600,
                ),
                const SizedBox(height: 19),
                GlobalButton(
                  title: "Check Answers",
                  onTap: () {
                    Navigator.pushReplacement(
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
                const SizedBox(height: 16),
                RetryButton(onTap: () {}),
              ],
            ),
          ),
          ResultBottomView(onTap: () {})
        ],
      ),
    );
  }
}
