import 'package:flutter/material.dart';

class AddTransactionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              maxLength: 20,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Cost'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
