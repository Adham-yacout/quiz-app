import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/Widgets/quizwidget.dart';

class Quizpage extends StatelessWidget{
  static const String routeName = 'quiz_page';

 

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      Image.asset(
      'assets/images/background.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
    Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(title: Text("Questions",),centerTitle: true,),
    body:QuizWidget()
    )
    ]
    );
  }

  @override
  void navigateToHome(List<String> answers) {
    // TODO: implement navigateToHome
  }
}
