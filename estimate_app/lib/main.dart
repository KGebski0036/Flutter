import 'package:flutter/material.dart';

import 'add_transaction_dialog.dart';
import 'models/transaction.dart';
import 'transaction_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transacrions = [
    Transaction(
        id: '0',
        title: 'banany',
        cost: 7.99,
        dateOfTransaction: DateTime.now()),
    Transaction(
        id: '1',
        title: 'białko',
        cost: 69.99,
        dateOfTransaction: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              child: Text('Chart'),
            ),
            elevation: 5,
          ),
          AddTransactionDialog(),
          Column(
            children: transacrions.map((e) =>
              TarnsactionCard(e)
            ).toList(),
          ),
        ],
      ),
    );
  }
}
