// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/services/quiz_questions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    print(name);

    Widget textInput() {
      return TextFormField(
        keyboardType: TextInputType.name,
        initialValue: name,
        onChanged: (text) {
          setState(() {
            name = text;
          });
        },
        decoration: InputDecoration(
          labelText: "Enter Email",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(),
          ),
        ),
      );
    }

    void onSubmitPress() {
      if (name.trim().isEmpty) {
        Fluttertoast.showToast(msg: 'Please enter your name');
        return;
      }

      QuizContent quizContentObj = QuizContent();
      quizContentObj.getQuizContent();

      Fluttertoast.showToast(msg: 'Quiz Started');
      print(quizContentObj.quizContent.runtimeType);

      Navigator.pushReplacementNamed(context, '/quiz', arguments: {
        'name': name,
        'quizContent': quizContentObj.quizContent,
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            textInput(),
            ElevatedButton(
                onPressed: () {
                  onSubmitPress();
                },
                child: Text('Start Quiz'))
          ],
        ),
      ),
    );
  }
}
