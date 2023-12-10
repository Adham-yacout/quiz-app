import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Answers/answers_view.dart';
import 'package:quizapp/Landingpage/Landingpage.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/Quizpage/quizpage_vm.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/questions.dart';

class QuizWidget extends StatefulWidget {
  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget>
    with TickerProviderStateMixin
    implements quizpageconnector {
  late AnimationController _controller;
  late Animation<Offset> _offsetanimation;
  late quizpage_viewmodel viewmodel;
  late List<String> questionanswers;
  bool showAnimation = false;
  int questionsnum=0;

  @override
  void initState() {
    super.initState();
    viewmodel = quizpage_viewmodel();
    viewmodel.connector = this;
    _initAnimation();
    questionanswers = viewmodel.getshuffledanswers();
  }
void loadanswers(){
  questionanswers = viewmodel.getshuffledanswers();
}
  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    _offsetanimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
  }

  void startAnimation() {
    if(questionsnum<questions.length-1){
      questionsnum++;
      _controller.reset();
      _controller.forward();
      loadanswers();
      setState(() {
        showAnimation = true;
      });
      Future.delayed(Duration(milliseconds: 900), () {
        setState(() {
          showAnimation = false;
        });
        // Load next question or perform other actions
        _initAnimation();
      });
    }

  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => viewmodel,
      child: Center(
        child: Stack(
          children: [
            // Animated card
            if (showAnimation)
              SlideTransition(
                position: _offsetanimation,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.height * 0.8,
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                  padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width / 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        viewmodel.current.Question,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      ...questionanswers.map((ans) {
                        return Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            margin: EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewmodel.answerQuestion(ans);
                                  startAnimation();
                                },
                                child: Text(ans),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 20.h)),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(300.w, 70.h)),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            // Static card
            Opacity(
              opacity: showAnimation ? 0.0 : 1.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.height * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width / 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      viewmodel.current.Question,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    ...questionanswers.map((ans) {
                      return Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                viewmodel.answerQuestion(ans);
                                startAnimation();
                              },
                              child: Text(ans),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h)),
                                fixedSize: MaterialStateProperty.all(
                                    Size(300.w, 70.h)),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToAnswers(User_Answers answers) {
    Navigator.pushReplacementNamed(
        context, Answers_view.routeName,
        arguments: answers);
  }
}
