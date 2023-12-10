import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/model/User_answers.dart';
import 'package:quizapp/model/answers.dart';

class Answerswidget extends StatelessWidget {
  User_Answers args;
  Answerswidget({required this.args});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            ...args.answers.map((e) {
              int index = args.answers.indexOf(e) + 1;
              String indexAsString = index.toString();
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: e.useranswer == e.correctanswer
                              ? Colors.blueAccent
                              : Colors.red[300],
                          child: Text(indexAsString),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.Question.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Your answer:" + e.useranswer.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "Correct answer:" + e.correctanswer.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            })
          ])),
    );
  }
}
