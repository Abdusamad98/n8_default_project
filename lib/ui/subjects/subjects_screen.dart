import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/data/my_repository.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/ui/language/language_screen.dart';
import 'package:n8_default_project/ui/subjects/widgets/subject_item.dart';
import 'package:n8_default_project/ui/quiz_detail/quiz_detail.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';
import 'package:n8_default_project/utils/utility_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.C_162023,
        elevation: 20,
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Image.asset(
              AppImages.drawer,
              fit: BoxFit.cover,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LanguageScreen();
                  }),
                );
              },
              leading: const Icon(
                Icons.language,
                color: AppColors.white,
              ),
              title: Text(
                tr("change_language"),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(color: AppColors.C_273032)
          ],
        ),
      ),
      appBar: AppBar(
        title:  Text(tr("change_subject")),
      ),
      body: ListView(
        children: [
          ...List.generate(MyRepository.quizData.length, (index) {
            SubjectModel subject = MyRepository.quizData[index];
            return SubjectItem(
              questionsCount: "${subject.questions.length} ta",
              color: subject.subjectColor,
              subjectTitle: subject.subjectName,
              level: subject.level.name,
              time: getMinutelyText(subject.quizTime),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizDetailScreen(
                        subject: subject,
                      );
                    },
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
