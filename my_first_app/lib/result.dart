import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resultCode;
  final Function resetQuiz;

  Result(this.resultCode, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Image.asset('assets/' + resultCode + '.PNG'),
        ElevatedButton(
          onPressed: resetQuiz,
          child: Text('Restart quiz'),
        )
      ]),
    );
  }
}
