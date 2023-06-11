import 'package:n8_default_project/models/question_model.dart';

class AnswersReport {
  final Map<int, int> answersMap;
  final List<QuestionModel> questions;

  AnswersReport({
    required this.answersMap,
    required this.questions,
  }) {
    checkAnswer();
  }

  int trueCount = 0;

  int falseCount = 0;
  int unselectedCount = 0;

  List<ReportModel> answersReport = [];

  void checkAnswer() {
    for (int i = 0; i < questions.length; i++) {
      switch (answersMap[i]) {
        case 0:
          {
            answersReport.add(
              ReportModel(
                answerState: AnswerState.unselected,
                questionText: questions[i].questionText,
                trueAnswer: questions[i].trueAnswer,
                yourAnswer: "",
              ),
            );
          }
          break;
        case 1:
          {
            if (questions[i].answer1 == questions[i].trueAnswer) {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.correct,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer1,
                ),
              );
            } else {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.incorrect,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer1,
                ),
              );
            }
          }
          break;
        case 2:
          {
            if (questions[i].answer2 == questions[i].trueAnswer) {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.correct,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer2,
                ),
              );
            } else {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.incorrect,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer2,
                ),
              );
            }
          }
          break;
        case 3:
          {
            if (questions[i].answer3 == questions[i].trueAnswer) {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.correct,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer3,
                ),
              );
            } else {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.incorrect,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer3,
                ),
              );
            }
          }
          break;
        case 4:
          {
            if (questions[i].answer4 == questions[i].trueAnswer) {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.correct,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer4,
                ),
              );
            } else {
              answersReport.add(
                ReportModel(
                  answerState: AnswerState.incorrect,
                  questionText: questions[i].questionText,
                  trueAnswer: questions[i].trueAnswer,
                  yourAnswer: questions[i].answer4,
                ),
              );
            }
          }
          break;
      }
    }

    trueCount = answersReport
        .where((element) => element.answerState == AnswerState.correct)
        .toList()
        .length;
    falseCount = answersReport
        .where((element) => element.answerState == AnswerState.incorrect)
        .toList()
        .length;

    unselectedCount = answersReport.length - trueCount - falseCount;
  }
}

class ReportModel {
  final String questionText;
  final String trueAnswer;
  final String yourAnswer;
  final AnswerState answerState;

  ReportModel({
    required this.answerState,
    required this.questionText,
    required this.trueAnswer,
    required this.yourAnswer,
  });
}

enum AnswerState {
  correct,
  incorrect,
  unselected,
}
