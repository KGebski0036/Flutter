import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  final _questions = [
    {'question': "Are you fat?", 'answers': ['Yes', 'No']},
    {'question': "How old are you?", 'answers': ['<15', '15-18', '18+']},
    {'question': "How fast can u rotate?", 'answers': ['less then 400 rpm', 'between 400-550 rmp', 'faster then 550 rmp']},
    ];
  String result = "";

  void _answerQuestion(String answer) {

    result += answer;

    setState(() {
      _questionsIndex++;
    });
  }

  void resetQuiz(){
    setState(() {
      _questionsIndex = 0;
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('What kind of door are you?'),
        ),
        body: Center(
          child: _questionsIndex < _questions.length ? Quiz(_answerQuestion, _questions, _questionsIndex) : Result(result, resetQuiz),
        ),
      ),
    );
  }
}
