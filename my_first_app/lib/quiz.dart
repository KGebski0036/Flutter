import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function onPressHandler;
  final int _questionsIndex;
  final List<Map<String, Object>> questions;

  Quiz(this.onPressHandler, this.questions, this._questionsIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[_questionsIndex]['question']),
        ...(questions[_questionsIndex]['answers'] as List<String>)
            .asMap().entries
            .map((e) => Answer(() => onPressHandler(e.key.toString()), e.value))
            .toList()
      ],
    );
  }
}
