import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/ui/quiz/quiz_screen.dart';
import 'package:n8_default_project/ui/quiz_detail/widgets/subject_image_view.dart';
import 'package:n8_default_project/ui/quiz_detail/widgets/time_container.dart';
import 'package:n8_default_project/ui/widgets/global_appbar.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../utils/utility_functions.dart';

class QuizDetailScreen extends StatefulWidget {
  QuizDetailScreen({
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
        padding: const EdgeInsets.only(top: 22),
        child: Stack(
          children: [
            Container(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: AppColors.C_162023,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ListView(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    children: [
                      SubjectImageView(iconPath: widget.subject.subjectImage),
                      const SizedBox(height: 16),
                      getRichText(
                        "Total Questions:  ",
                        widget.subject.questions.length.toString(),
                        context,
                      ),
                      const SizedBox(height: 12),
                      getRichText(
                        "Total time:  ",
                        getMinutelyText(widget.subject.quizTime),
                        context,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Instructions:",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.subject.description,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400, letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.C_273032,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeContainer(
                        timeText: getMinutelyText(widget.subject.quizTime)),
                    const SizedBox(width: 32),
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
