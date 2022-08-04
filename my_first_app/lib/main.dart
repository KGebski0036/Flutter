import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  final questions = [
    {'question': "Are you fat?", 'answers': ['Yes', 'No']},
    {'question': "How old are you?", 'answers': ['<15', '15-18', '18-25', '25+']},
    {'question': "How fast can u rotate?", 'answers': ['less then 400 rpm', 'between 400-550 rmp', 'faster then 550 rmp']},
    ];

  void _answerQuestion() {
    setState(() {
      if(++_questionsIndex >= questions.length){
        _questionsIndex = 0;
      }
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
          child: Column(
            children: <Widget>[
              Question(questions[_questionsIndex]['question']),
              ...(questions[_questionsIndex]['answers'] as List<String>).map((e) => Answer(_answerQuestion, e)).toList()
            ],
          ),
        ),
      ),
    );
  }
}
