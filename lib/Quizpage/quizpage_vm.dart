import 'package:flutter/cupertino.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/model/QuizQuestion.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/answers.dart';

import '../model/questions.dart';

class quizpage_viewmodel extends ChangeNotifier {
  late quizpageconnector connector;
  int currentQuestionIndex = 0;
  late Animation<Offset> offsetanimation;
  QuizQuestion current= questions[0];
   User_Answers answers=User_Answers(answers: [], score: 0);
  late AnimationController controller;
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void answerQuestion(String ans) {
    currentQuestionIndex++;
    Answers listans=Answers(Question: questions[currentQuestionIndex-1].Question, correctanswer: questions[currentQuestionIndex-1].answers[0], useranswer: ans);
    answers.answers.add(listans);
    if(questions[currentQuestionIndex-1].answers[0]== ans)
      {
        answers.score+=1;

      }


    if(currentQuestionIndex>=questions.length)
      {
        connector.navigateToAnswers(answers);
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