import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/ui/quiz/quiz_screen.dart';
import 'package:n8_default_project/ui/quiz_detail/widgets/subject_image_view.dart';
import 'package:n8_default_project/ui/quiz_detail/widgets/time_container.dart';
import 'package:n8_default_project/ui/widgets/global_appbar.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';


import '../../utils/utility_functions.dart';

class QuizDetailScreen extends StatefulWidget {
  const QuizDetailScreen({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final SubjectModel subject;

  @override
  State<QuizDetailScreen> createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "${widget.subject.subjectName} quiz info",
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 22.h),
        child: Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: AppColors.C_162023,
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 24.h),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                       EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
                  children: [
                    SubjectImageView(iconPath: widget.subject.subjectImage),
                     SizedBox(height: 16.h),
                    getRichText(
                      "Total Questions:  ",
                      widget.subject.questions.length.toString(),
                      context,
                    ),
                     SizedBox(height: 12.h),
                    getRichText(
                      "Total time:  ",
                      getMinutelyText(widget.subject.quizTime),
                      context,
                    ),
                     SizedBox(height: 12.h),
                    Text(
                      "Instructions:",
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                     SizedBox(height: 5.h),
                    Text(
                      widget.subject.description,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400, letterSpacing: 1.2),
                    ),
                     SizedBox( height: 80.h,)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 32.h),
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: AppColors.C_273032,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeContainer(
                        timeText: getMinutelyText(widget.subject.quizTime)),
                     SizedBox(width: 32.w),
                    Expanded(
                      child: GlobalButton(
                        title: "Start Quiz",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return QuizScreen(subject: widget.subject);
                              },
                            ),
                          );
                        },
                        color: AppColors.C_0E81B4,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
