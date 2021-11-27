import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class QuizQuestion {
  String question = '';
  List<String> options = [];
  String answer = '';

  QuizQuestion(
      {required this.question, required this.options, required this.answer});
}

class QuizContent {
  List data = [
    {
      "category": "Geography",
      "type": "multiple",
      "difficulty": "medium",
      "question": "In which English county is Stonehenge?",
      "correct_answer": "Wiltshire",
      "incorrect_answers": ["Somerset", "Cumbria", "Herefordshire"]
    },
    {
      "category": "Sports",
      "type": "multiple",
      "difficulty": "medium",
      "question": "Which nation hosted the FIFA World Cup in 2006?",
      "correct_answer": "Germany",
      "incorrect_answers": ["United Kingdom", "Brazil", "South Africa"]
    },
    {
      "category": "General Knowledge",
      "type": "multiple",
      "difficulty": "medium",
      "question": "What is the Swedish word for &quot;window&quot;?",
      "correct_answer": "F&ouml;nster",
      "incorrect_answers": ["H&aring;l", "Sk&auml;rm", "Ruta"]
    },
    {
      "category": "Entertainment: Video Games",
      "type": "multiple",
      "difficulty": "hard",
      "question":
          "What device allows Tracer to manipulate her own time in the game &quot;Overwatch&quot;?",
      "correct_answer": "Chronal Accelerator",
      "incorrect_answers": [
        "B.L.I.N.K",
        "Spacial Displacement Manipulator",
        "TMD (Time Manipulation Device)"
      ]
    },
    {
      "category": "Entertainment: Music",
      "type": "multiple",
      "difficulty": "medium",
      "question":
          "What is the last song on the first Panic! At the Disco album?",
      "correct_answer": "Build God, Then We&#039;ll Talk",
      "incorrect_answers": [
        "Nails for Breakfast, Tacks for Snacks",
        "I Write Sins Not Tragedies",
        "Lying Is The Most Fun A Girl Can Have Without Taking Her Clothes Off"
      ]
    },
    {
      "category": "Politics",
      "type": "boolean",
      "difficulty": "medium",
      "question":
          "The State of Queensland, Australia voted NO to a referendum for daylight savings in 1992.",
      "correct_answer": "True",
      "incorrect_answers": ["False"]
    },
    {
      "category": "History",
      "type": "multiple",
      "difficulty": "medium",
      "question": "When was the Grand Patriotic War in the USSR concluded?",
      "correct_answer": "May 9th, 1945",
      "incorrect_answers": [
        "September 2nd, 1945",
        "August 9th, 1945",
        "December 11th, 1945"
      ]
    },
    {
      "category": "Animals",
      "type": "boolean",
      "difficulty": "easy",
      "question": "Rabbits are carnivores.",
      "correct_answer": "False",
      "incorrect_answers": ["True"]
    },
    {
      "category": "Entertainment: Video Games",
      "type": "multiple",
      "difficulty": "hard",
      "question": "Which retro video game was released first?",
      "correct_answer": "Space Invaders",
      "incorrect_answers": ["Galaga", "Pac-Man", "Asteroids"]
    },
    {
      "category": "Entertainment: Video Games",
      "type": "multiple",
      "difficulty": "easy",
      "question":
          "In the video game &quot;Postal 2&quot;, what is the name of Postal Dude&#039;s dog?",
      "correct_answer": "Champ",
      "incorrect_answers": ["Snoopy", "Krotchy", "Duke"]
    }
  ];

 List<QuizQuestion> quizContent = [];

  void getQuizContent() {
    for (var item in data) {
      List<String> options = item['incorrect_answers'];
      options.add(item['correct_answer']);
      options.shuffle();
      quizContent.add(QuizQuestion(
          question: item['question'],
          options: options,
          answer: item['correct_answer']));
    }
    // print(quizContent);

    // Future<void> getQuizContent() async {
    //   var url = Uri.parse('https://opentdb.com/api.php?amount=10');
    //   try {
    //     http.Response response = await http.get(url);
    //     return print('${response.statusCode}');
    //     if (response.statusCode == 200) {
    //       dynamic data = jsonDecode(response.body);
    //       print(data);
    //       return;
    //       data.map((e) {
    //         print({
    //           'question': e.question,
    //           'options': e.incorrect_answers.add(e.correct_answer).shuffle(),
    //           'answer': e.correct_answer
    //         });
    //         // quizContent.add(QuizQuestion(
    //         //     question: e.question,
    //         //     options: e.incorrect_answers.add(e.correct_answer).shuffle(),
    //         //     answer: e.correct_answer));
    //       });
    //       quizContent = response.body;
    //       Fluttertoast.showToast(msg: 'Quiz started');
    //     } else {
    //       Fluttertoast.showToast(
    //           msg:
    //               'Something went wrong, please try again. ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     print("ERR [quizContent] =======> $e");
    //   }
    // }
  }
}
