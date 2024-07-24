import 'package:dars_63/controllers/questions_controller.dart';
import 'package:dars_63/main.dart';
import 'package:dars_63/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(QuestionsController());
  String _trueLetters = '';
  int questionsIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Question _question = _controller.getQuestions[questionsIndex];

    if(_trueLetters.toLowerCase() == _controller.getQuestions[questionsIndex].questionAnswer.toLowerCase()){
      questionsIndex++;
      if(questionsIndex == _controller.getQuestions.length){
        questionsIndex = 0;
      }
      setState(() {
        _trueLetters = '';
      });
    }

    return Scaffold(
      body: _controller.getQuestions.length == 0
          ? Center(
              child: Text("Savollar mavjud emas"),
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Answer count ${questionsIndex + 1}/${_controller.getQuestions.length}"),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "${_controller.getQuestions[questionsIndex].questionTitle}",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0;
              i < _controller.getQuestions[questionsIndex].questionAnswer.length;
              i++)
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                  ),
                  alignment: Alignment.center,
                  child: Text("${_trueLetters.length - 1 >= i ? _controller.getQuestions[questionsIndex].questionAnswer[i].toUpperCase() : ""}",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
            ],
          ),

          const SizedBox(height: 50,),

          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i = 0; i < _controller.getQuestions[questionsIndex].letters.length;i++)
                    InkWell(
                      onTap: (){
                        print(_controller.getQuestions[questionsIndex].letters[i]);
                        if(_controller.getQuestions[questionsIndex].letters[i].toLowerCase() == _controller.getQuestions[questionsIndex].questionAnswer[_trueLetters.length].toLowerCase()){
                          _trueLetters+= _controller.getQuestions[questionsIndex].letters[i];
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue
                        ),
                        alignment: Alignment.center,
                        child: Text("${_controller.getQuestions[questionsIndex].letters[i]}",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
