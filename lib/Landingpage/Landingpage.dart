import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Quizpage/Quizpage.dart';

class Landingpage extends StatelessWidget {
  static const String routeName = 'landing_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent,
            Colors.red,

          ]

        )
      ),
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset('assets/images/qlogo.png',color: Colors.black,),
            SizedBox(height: 50,),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0), // Set the radius for rounded corners
          child: ElevatedButton(
            onPressed: () {
             Navigator.pushReplacementNamed(context, Quizpage.routeName);
            },
            child: Text('Start the quiz'),
          ),

        )],
        ),
    );



  }
}
