import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["Are you fat?", "How old are you?"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('What kind of door are you?'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(questions[0]),
              ElevatedButton(onPressed: answerQuestion, child: Text('bruh')),
            ],
          ),
        ),
      ),
    );
  }
}
