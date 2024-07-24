import 'package:dars_63/models/question.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class QuestionsController extends GetxController{
  RxList<Question> _questions = <Question>[
    Question(questionTitle: "Flutter qaysi kompaniya tarafidan ishlab chiqarilgan", questionAnswer: "Google", letters: ['G','A','B','O','L','I','S','D','E','R','Y','U','I','N',]),
    Question(questionTitle: "Apple Companiyasi telefoni nomi?", questionAnswer: "IPHONE", letters: ['G','I','B','P','H','E','N','O','E','R','Y','U','I','N',]),
  ].obs;



  List<Question> get getQuestions {
    return [..._questions];
  }


}