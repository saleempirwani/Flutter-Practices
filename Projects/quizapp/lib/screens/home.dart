// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/services/quiz_questions.dart';
import 'package:flutter_picker/flutter_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '', amount = '';

  QuizContent quizContentObj = QuizContent();

  @override
  Widget build(BuildContext context) {
    void onSubmitPress() async {
      if (name.trim().isEmpty) {
        Fluttertoast.showToast(msg: 'Please enter your name');
        return;
      }

      setState(() {});

      await quizContentObj.getQuizContent(amount: amount);

      Fluttertoast.showToast(msg: 'Quiz Started');
      Navigator.pushReplacementNamed(context, '/quiz', arguments: {
        'name': name,
        'quizContent': quizContentObj.quizContent,
      });
    }

    Widget textInput(placeholder, callback, {nameType = false}) {
      return TextFormField(
        keyboardType: nameType ? TextInputType.name : TextInputType.number,
        // initialValue: name,
        onChanged: (text) {
          callback(text);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          labelText: placeholder,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(),
          ),
        ),
      );
    }

    final spinkit = SpinKitCircle(
      color: Colors.white,
      size: 20.0,
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz App',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              textInput(
                'Enter your username',
                (text) {
                  setState(() {
                    name = text;
                  });
                },
                nameType: true,
              ),
              SizedBox(
                height: 15,
              ),
              textInput('Enter amout of question', (text) {
                setState(() {
                  amount = text;
                });
              }),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      setState(() {});
                      quizContentObj.loading ? null : onSubmitPress();
                    },
                    child:
                        quizContentObj.loading ? spinkit : Text('Start Quiz')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
