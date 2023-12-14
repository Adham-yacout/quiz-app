import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Answers/answers_view.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/Quizpage/quizpage_vm.dart';
import 'package:quizapp/Widgets/Containerwidget.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/questions.dart';

class QuizWidget extends StatefulWidget {
  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget>
    with TickerProviderStateMixin
    implements quizpageconnector {
  late quizpage_viewmodel viewmodel;
  late List<String> questionanswers;
  bool showAnimation = false;
  int questionsnum = 0;

  @override
  void initState() {
    super.initState();
    viewmodel = quizpage_viewmodel();
    viewmodel.connector = this;
    _initAnimation();
    questionanswers = viewmodel.getshuffledanswers();
  }

  void loadanswers() {
    questionanswers = viewmodel.getshuffledanswers();
  }

  void _initAnimation() {
    viewmodel.controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    viewmodel.offsetanimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: viewmodel.controller, curve: Curves.elasticInOut));
  }

  void startAnimation() {
    if (questionsnum < questions.length - 1) {
      questionsnum++;
      viewmodel.controller.reset();
      viewmodel.controller.forward();
      loadanswers();
      setState(() {
        showAnimation = true;
      });
      Future.delayed(Duration(milliseconds: 900), () {
        setState(() {
          viewmodel.dispose();
          showAnimation = false;
        });
        // Load next question or perform other actions
        _initAnimation();
      });
    }
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
                  position: viewmodel.offsetanimation,
                  child:
                  Containerwidget(
                    questionanswers: questionanswers,
                    questionbody: viewmodel.current.Question,
                    answerquestion: viewmodel.answerQuestion,
                    animation: startAnimation,
                  )),
            // Static card
            Opacity(
                opacity: showAnimation ? 0.0 : 1.0,
                child: Containerwidget(
                  questionanswers: questionanswers,
                  questionbody: viewmodel.current.Question,
                  answerquestion: viewmodel.answerQuestion,
                  animation: startAnimation,
                )),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToAnswers(User_Answers answers) {
    Navigator.pushReplacementNamed(context, Answers_view.routeName,
        arguments: answers);
  }
}
