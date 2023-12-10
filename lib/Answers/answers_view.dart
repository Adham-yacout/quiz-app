import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/Answers/answerwidget.dart';
import 'package:quizapp/Landingpage/Landingpage.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/answers.dart';

import '../model/questions.dart';

class Answers_view extends StatelessWidget {
  static const String routeName = 'Answers';
  const Answers_view({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as User_Answers;
  return  Stack(

      children:[
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Text('You answered ${args.score} out of ${questions.length} questions correctly!',
                style:  TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h,),
              Answerswidget(args: args,),
              Container(
                width: MediaQuery.of(context).size.width*0.6, // Set the desired width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Landingpage.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt), // Replace with your desired icon
                      SizedBox(width: 8), // Adjust the spacing between the icon and text
                      Text(
                        'Restart Quiz',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]
    );

  }
  }

