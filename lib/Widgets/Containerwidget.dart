import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Containerwidget extends StatelessWidget {
 String questionbody;
 List<String> questionanswers;
 Function answerquestion;
 Function animation;
 Containerwidget({required this.questionbody,required this.questionanswers,required this.answerquestion,
   required this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            questionbody,
            style: TextStyle(fontSize: 20.sp),
          ),
          ...questionanswers.map((ans) {
            return Container(

              child: Container(
                margin: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      answerquestion(ans);
                      animation();
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
    );
  }
}
