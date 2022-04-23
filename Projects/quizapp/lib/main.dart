import 'package:flutter/material.dart';
import 'package:quizapp/screens/home.dart';
import 'package:quizapp/screens/quiz.dart';
import 'package:quizapp/screens/score_board.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/quiz': (context) => Quiz(),
      '/score': (context) => ScoreBoard(),
    },
  ));
}
