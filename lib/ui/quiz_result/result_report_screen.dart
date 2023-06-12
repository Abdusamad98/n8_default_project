import 'package:flutter/material.dart';
import 'package:n8_default_project/models/answers_report.dart';

import '../widgets/global_appbar.dart';

class ResultReportScreen extends StatelessWidget {
  const ResultReportScreen({Key? key, required this.answersReport})
      : super(key: key);

  final AnswersReport answersReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Quiz Report",
      ),
      body: ListView(
        children: List.generate(
          answersReport.answersReport.length,
          (index) {
            ReportModel report = answersReport.answersReport[index];
            return ListTile(
              title: Text(report.questionText),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(report.answerState.name),
                      Text("True answer : ${report.trueAnswer}")
                    ],
                  ),
                  Text("Your answer : ${report.yourAnswer}")
                ],
              ),
              trailing: report.answerState == AnswerState.unselected
                  ? const Icon(
                      Icons.minimize_outlined,
                      color: Colors.red,
                    )
                  : report.answerState == AnswerState.correct
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
            );
          },
        ),
      ),
    );
  }
}
