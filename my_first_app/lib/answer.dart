import 'package:flutter/material.dart';


class Answer extends StatelessWidget {

  final Function onPressHandler;
  final String answerText;

  Answer(this.onPressHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressHandler,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
          primary: Colors.purple
        ),
        ),
        width: 200,
    );
  }
}