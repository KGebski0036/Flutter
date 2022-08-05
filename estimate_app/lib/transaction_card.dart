import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TarnsactionCard extends StatelessWidget {
  const TarnsactionCard(this.transaction, {Key key}) : super(key: key);

  final Transaction transaction;
  final String costSign = " \$";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 80,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(5),
            child: Text(
              transaction.cost.toString() + costSign,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.purple, width: 2))),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                transaction.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                  
                  ),
                ),
              Text(
                DateFormat.yMMMEd().format(transaction.dateOfTransaction),
                style: TextStyle(color: Colors.grey,),
                textAlign: TextAlign.right,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
