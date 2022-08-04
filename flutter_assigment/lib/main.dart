import 'package:flutter/material.dart';

import 'control_text.dart';
import 'my_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String title = 'My first app';

  final List<String> texts = ["AAA", "BB"];
  var textIndex = 0;

  void _changeText() {
    setState(() {
      if(++textIndex >= texts.length){
        textIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyText(texts[textIndex]),
              ControlText(_changeText)
            ],
          ),
        ),
      ),
    );
  }
}
