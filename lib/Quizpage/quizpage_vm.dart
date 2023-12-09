import 'package:flutter/cupertino.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/model/QuizQuestion.dart';

import '../model/questions.dart';

class quizpage_viewmodel extends ChangeNotifier {
  late quizpageconnector connector;
  int currentQuestionIndex = 0;
  QuizQuestion current= questions[0];
  List<String> answers=[];

  void answerQuestion(String ans) {
    currentQuestionIndex++;
    if(currentQuestionIndex>=questions.length)
      {
        connector.navigateToHome(answers);
      }
    else{
      current=getCurrentQuestion();
      notifyListeners();
    }


  }

  QuizQuestion getCurrentQuestion() {
    return questions[currentQuestionIndex];
  }
  List<String> getshuffledanswers(){
    return current.getshuffledquestions();
  }
    }