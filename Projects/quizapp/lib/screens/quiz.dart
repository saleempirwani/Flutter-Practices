// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quizapp/services/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map params = {};
  List<QuizQuestion> quizContent = <QuizQuestion>[];
  int next = 0, score = 0;

  @override
  Widget build(BuildContext context) {
    params = ModalRoute.of(context)?.settings.arguments as Map;
    quizContent = params['quizContent'];

    void onSelectOption(item) {
      if (item == quizContent[next].answer) {
        score += 1;
      }

      if (next < quizContent.length - 1) {
        setState(() {
          next += 1;
        });
      } else {
        Navigator.pushReplacementNamed(context, '/score', arguments: {
          'name': params['name'],
          'score': score,
          'total': quizContent.length,
        });
      }
    }

    Widget html(text) {
      return Html(
          data: """
      <p style="color: #333; font-size: 16">$text</p>
    """);
    }

// Widgets
    Widget question() {
      return Card(
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: html(
              'Q${next + 1}. ${quizContent[next].question}',
            )

            // Text(
            //   'Q${next + 1}. ${quizContent[next].question}',
            //   style: TextStyle(
            //     fontSize: 18,
            //   ),
            // ),
            ),
      );
    }

    Widget options() {
      return (Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: quizContent[next].options.map((item) {
        int index = quizContent[next].options.indexOf(item) + 1;
        return SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                onPressed: () {
                  onSelectOption(item);
                },
                child: html('$index . $item'),

                // Text(
                //   '$index . $item',
                //   style: TextStyle(
                //     fontSize: 18,
                //     color: Colors.black,
                //   ),
                // ),
              ),
            ),
          ),
        );
      }).toList()));
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              question(),
              SizedBox(
                height: 20,
              ),
              options(),
            ],
          ),
        ),
      ),
    );
  }
}
