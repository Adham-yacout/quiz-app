import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/Landingpage/Landingpage.dart';
import 'package:quizapp/Quizpage/Quizpage.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) =>
            MaterialApp(
              title: 'Quiz App',
              debugShowCheckedModeBanner: false,
              initialRoute: Landingpage.routeName,
              routes: {
                Landingpage.routeName: (context) => Landingpage(),
                Quizpage.routeName: (context) => Quizpage(),
              },


            )
    );
  }
  }

