class QuestionModel {
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String trueAnswer;

  QuestionModel({
    required this.trueAnswer,
    required this.questionText,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });
}
