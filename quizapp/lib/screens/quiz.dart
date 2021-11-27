// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/services/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map params = {};
  List<QuizQuestion> quizContent = <QuizQuestion>[];
  int next = 0;

  @override
  Widget build(BuildContext context) {
    params = ModalRoute.of(context)?.settings.arguments as Map;
    quizContent = params['quizContent'];

    Widget question() {
      return Text(
        'Q${next + 1}. ${quizContent[next].question}',
        style: TextStyle(
          fontSize: 18,
        ),
      );
    }

    Widget options() {
      return (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: quizContent[next].options.map((item) {
            int index = quizContent[next].options.indexOf(item) + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (next < quizContent.length - 1) {
                      next += 1;
                    } else {
                      // Navigator.pushReplacementNamed(context, '/score',arguments: {
                      //   'name': params['name'],
                      //   'score': score,
                      // } )
                    }
                  });
                },
                child: Text(
                  '$index . $item',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList()));
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            question(),
            SizedBox(
              height: 20,
            ),
            options(),
          ],
        ),
      ),
    );
  }
}
