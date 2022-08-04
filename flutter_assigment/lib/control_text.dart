import 'package:flutter/material.dart';

class ControlText extends StatelessWidget {
  const ControlText(this.texthandler, {Key? key}) : super(key: key);

  final String text = "Change text";
  final VoidCallback texthandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: texthandler, child: Text(text));
  }
}