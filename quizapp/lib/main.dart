import 'package:flutter/material.dart';
import 'package:quizapp/screens/home.dart';
import 'package:quizapp/screens/quiz.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/quiz': (context) => Quiz(),
      // '/score': (context) => ScoreBoard(),
    },
  ));
}
