import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TarnsactionCard extends StatelessWidget {
  const TarnsactionCard(this.transaction, this.deleteTransaction);

  final Transaction transaction;
  final Function deleteTransaction;
  final String costSign = " \$";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 90,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(5),
            child: Text(
              transaction.cost.toStringAsFixed(2) + costSign,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2)),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMEd().format(transaction.dateOfTransaction),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.right,
                ),
              ]),
            ),
          ),
          IconButton(
            onPressed: () => deleteTransaction(transaction.id),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
