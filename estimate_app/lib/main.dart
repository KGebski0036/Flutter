import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/add_transaction_dialog.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/no_transactions_added.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme:
          ThemeData(primarySwatch: Colors.deepOrange, fontFamily: 'Quicksand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transacrions = [];

  List<Transaction> get _recentTransactions {
    return transacrions
        .where((element) => element.dateOfTransaction
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Opensans'),
        ),
        actions: [
          IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              child: Chart(_recentTransactions),
            ),
            elevation: 5,
          ),
          Card(
            child: transacrions.isEmpty
                ? NoTransactionsAdded()
                : TransactionList(transacrions, deleteTransaction),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: ((context) => AddTransactionDialog(_addNewTransaction)));
  }

  void _addNewTransaction(
      String title, double cost, DateTime timeOfTransaction) {
    if (timeOfTransaction == null) timeOfTransaction = DateTime.now();

    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        cost: cost,
        dateOfTransaction: timeOfTransaction);

    setState(() {
      transacrions.add(newTransaction);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transacrions.removeWhere((element) => element.id == id);
    });
  }
}
