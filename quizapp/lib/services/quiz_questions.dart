import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class QuizQuestion {
  String question = '';
  List options = [];
  String answer = '';

  QuizQuestion(
      {required this.question, required this.options, required this.answer});
}

class QuizContent {
  List<QuizQuestion> quizContent = [];
  bool loading = false;

  Future<void> getQuizContent({amount = 10}) async {
    var url = Uri.parse('https://opentdb.com/api.php?amount=$amount');
    loading = true;
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        loading = false;
        List data = jsonDecode(response.body)['results'];
        for (var item in data) {
          List options = item['incorrect_answers'];
          options.add(item['correct_answer']);
          options.shuffle();
          quizContent.add(QuizQuestion(
              question: item['question'],
              options: options,
              answer: item['correct_answer']));
        }
      } else {
        Fluttertoast.showToast(
            msg:
                'Something went wrong, please try again. ${response.statusCode}');
      }
    } catch (e) {
      loading = false;
      print("ERR [quizContent] =======> $e");
    }
  }
}
