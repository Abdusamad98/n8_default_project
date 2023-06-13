import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/models/question_model.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/ui/quiz/widgets/answer_item.dart';
import 'package:n8_default_project/ui/quiz/widgets/bottom_buttons_view.dart';
import 'package:n8_default_project/ui/quiz/widgets/quiz_appbar.dart';
import 'package:n8_default_project/ui/quiz/widgets/quiz_screen_top.dart';
import 'package:n8_default_project/ui/quiz_result/quiz_result.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/utility_functions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final SubjectModel subject;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> subjectQuestions = [];

  int count = 0;

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = 0;

  Map<int, int> answersMap = {};

  @override
  void initState() {
    _init();
    _timerLogic();
    super.initState();
  }

  _init() {
    subjectQuestions = widget.subject.questions;
    for (int i = 0; i < subjectQuestions.length; i++) {
      answersMap[i] = 0;
    }
  }

  Future<void> _timerLogic() async {
    for (int i = 0; i < widget.subject.quizTime; i++) {
      await Future.delayed(const Duration(seconds: 1));
      count = i + 1;
      setState(() {});
    }
    _navigateToResultScreen();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: QuizAppBar(
        onSubmitTap: _navigateToResultScreen,
        onTap: () {
          Navigator.pop(context);
        },
        title: "${widget.subject.subjectName} quiz info",
      ),
      body: Column(
        children: [
          SizedBox(height: 12.h),
          QuizScreenTop(
            rate: (1 - count / widget.subject.quizTime),
            subjectName: widget.subject.subjectName,
            height: height,
            timeText: getMinutelyText(widget.subject.quizTime - count),
          ),
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: AppColors.C_162023,
              ),
              child: ListView(
                padding:  EdgeInsets.symmetric(vertical: 28.h,horizontal: 28.w),
                children: [
                  getRichTextForCount("Q.${currentQuestionIndex + 1}/",
                      "${subjectQuestions.length}", context),
                   SizedBox(height: 12.h),
                  Text(
                    subjectQuestions[currentQuestionIndex].questionText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 15.sp),
                  ),
                  AnswerItem(
                    isSelected: selectedAnswerIndex == 1,
                    variantName: "A.",
                    answerText: subjectQuestions[currentQuestionIndex].answer1,
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = 1;
                      });
                      answersMap[currentQuestionIndex] = selectedAnswerIndex;
                    },
                  ),
                  AnswerItem(
                    isSelected: selectedAnswerIndex == 2,
                    variantName: "B.",
                    answerText: subjectQuestions[currentQuestionIndex].answer2,
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = 2;
                      });
                      answersMap[currentQuestionIndex] = selectedAnswerIndex;
                    },
                  ),
                  AnswerItem(
                    isSelected: selectedAnswerIndex == 3,
                    variantName: "C.",
                    answerText: subjectQuestions[currentQuestionIndex].answer3,
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = 3;
                      });
                      answersMap[currentQuestionIndex] = selectedAnswerIndex;
                    },
                  ),
                  AnswerItem(
                    isSelected: selectedAnswerIndex == 4,
                    variantName: "D.",
                    answerText: subjectQuestions[currentQuestionIndex].answer4,
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = 4;
                      });
                      answersMap[currentQuestionIndex] = selectedAnswerIndex;
                    },
                  ),
                ],
              ),
            ),
          ),
          BottomButtonViews(
            onNextTapVisibility:
                !(currentQuestionIndex == subjectQuestions.length - 1),
            onPreviousTapVisibility: !(currentQuestionIndex == 0),
            onNextTap: () {
              if (currentQuestionIndex < subjectQuestions.length - 1) {
                currentQuestionIndex++;
                selectedAnswerIndex = answersMap[currentQuestionIndex]!;
                setState(() {});
              }
              // else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("Savollar tamom")));
              // }
            },
            onPreviousTap: () {
              if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                selectedAnswerIndex = answersMap[currentQuestionIndex]!;
                setState(() {});
              }
              // else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text("Bu 1- savol")));
              // }
            },
          )
        ],
      ),
    );
  }

  void _navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QuizResult(
            passedTime: count,
            answersMap: answersMap,
            subjectModel: widget.subject,
          );
        },
      ),
    );
  }
}
