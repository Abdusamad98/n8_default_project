import 'package:n8_default_project/models/question_model.dart';
import 'package:n8_default_project/models/quiz_level.dart';
import 'package:n8_default_project/models/subject_model.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class MyRepository {
  static List<SubjectModel> quizData = [
    SubjectModel(
      subjectImage: AppImages.math,
      subjectName: "Mathematics",
      quizTime: 65,
      level: QuizLevel.easy,
      description:
          '''The quizzes consists of questions carefully designed to help you self-assess your comprehension of the information presented on the topics covered in the module.
After responding to a question, click on the "Next Question" button at the bottom to go to the next question. After responding to the 8th question, click on "Close" at the top of the window to exit the quiz.
If you select an incorrect response for a question, you can try again until you get the correct response. If you retake the quiz, the questions and their respective responses will be randomized.
      ''',
      subjectColor: AppColors.C_F2954D,
      questions: [
        QuestionModel(
          trueAnswer: "25",
          questionText: "What is 5 multiplied by 5?",
          answer1: "1",
          answer2: "16",
          answer3: "20",
          answer4: "25",
        ),
        QuestionModel(
          trueAnswer: "60",
          questionText: "What is 12 multiplied by 5?",
          answer1: "30",
          answer2: "50",
          answer3: "60",
          answer4: "75",
        ),
        QuestionModel(
          trueAnswer: "144",
          questionText: "What is 12 squared?",
          answer1: "36",
          answer2: "64",
          answer3: "100",
          answer4: "144",
        ),
        QuestionModel(
          trueAnswer: "90",
          questionText: "What is the sum of angles in a right triangle?",
          answer1: "45",
          answer2: "90",
          answer3: "180",
          answer4: "360",
        ),
      ],
    ),
    SubjectModel(
      subjectImage: AppImages.english,
      description: "English Test",
      subjectColor: AppColors.C_0E81B4,
      level: QuizLevel.easy,
      questions: [
        QuestionModel(
          trueAnswer: "4",
          questionText: "How many vowels are there in the English alphabet?",
          answer1: "5",
          answer2: "10",
          answer3: "20",
          answer4: "4",
        ),
        QuestionModel(
          trueAnswer: "London",
          questionText: "What is the capital of England?",
          answer1: "Paris",
          answer2: "Berlin",
          answer3: "London",
          answer4: "Madrid",
        ),
        QuestionModel(
          trueAnswer: "William Shakespeare",
          questionText: "Who wrote the play 'Romeo and Juliet'?",
          answer1: "Mark Twain",
          answer2: "Charles Dickens",
          answer3: "Jane Austen",
          answer4: "William Shakespeare",
        ),
        QuestionModel(
          trueAnswer: "Red, Green, Blue",
          questionText: "What are the primary colors?",
          answer1: "Yellow, Blue, Red",
          answer2: "Red, Green, Blue",
          answer3: "Orange, Purple, Green",
          answer4: "Black, White, Gray",
        ),
      ],
      subjectName: "English",
      quizTime: 600,
    ),
    SubjectModel(
      subjectImage: AppImages.flutter,
      description: "Flutter Test",
      subjectColor: AppColors.C_162023,
      level: QuizLevel.easy,
      questions: [
        QuestionModel(
          trueAnswer: "Hot Reload",
          questionText:
              "What is the feature in Flutter that allows you to see changes immediately?",
          answer1: "Hot Reload",
          answer2: "Hot Restart",
          answer3: "Hot Swap",
          answer4: "Hot Update",
        ),
        QuestionModel(
          trueAnswer: "Widget",
          questionText:
              "In Flutter, what is the basic building block of the user interface?",
          answer1: "Block",
          answer2: "Component",
          answer3: "Module",
          answer4: "Widget",
        ),
        QuestionModel(
          trueAnswer: "Dart",
          questionText:
              "Which programming language is used for Flutter app development?",
          answer1: "Java",
          answer2: "Swift",
          answer3: "Python",
          answer4: "Dart",
        ),
        QuestionModel(
          trueAnswer: "MaterialApp",
          questionText: "What is the top-level widget in a Flutter app?",
          answer1: "HomeScreen",
          answer2: "MainScreen",
          answer3: "MaterialApp",
          answer4: "RootWidget",
        ),
      ],
      subjectName: "Flutter",
      quizTime: 600,
    ),
  ];
}
