import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_card/animated_flip_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Answers/answers_view.dart';
import 'package:quizapp/Landingpage/Landingpage.dart';
import 'package:quizapp/Quizpage/quizpage_connector.dart';
import 'package:quizapp/Quizpage/quizpage_vm.dart';
import 'package:quizapp/model/QuizQuestion.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/answers.dart';
import 'package:quizapp/model/questions.dart';

class QuizWidget extends StatefulWidget {
  @override
  State<QuizWidget> createState() => _QuizWidgetState();




}

class _QuizWidgetState extends State<QuizWidget>  implements quizpageconnector
 {
  @override

  quizpage_viewmodel viewmodel=quizpage_viewmodel();
  void initState() {

    super.initState();
    viewmodel.connector=this;

  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>viewmodel,
      child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(viewmodel.current.Question,style: TextStyle(fontSize: 20.sp),),
            ... viewmodel.getshuffledanswers().map((ans)  {
                  return  Container(
                    decoration:  BoxDecoration(
                    ),
                    child:
                    Container(
                      margin: EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        // Set the radius for rounded corners
                        child: ElevatedButton(
                          onPressed: () {
                          viewmodel.answerQuestion(ans);
                              setState(() {
                              });
                          },
                          child: Text(ans),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:20.w ,vertical:20.h )),

                            fixedSize: MaterialStateProperty.all(Size(300.w,70.h))


                          ),
                        ),

                      ),
                    ),

                  );
                })

              ],
            ),),

          ),
    );

  }

  @override
  void navigateToAnswers(User_Answers answers) {
    Navigator.pushReplacementNamed(context, Answers_view.routeName,arguments: answers);
  }
}
