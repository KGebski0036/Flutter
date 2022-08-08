import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        if (_datesAreEqual(transactions[i].dateOfTransaction, weekDay))
          totalSum += transactions[i].cost;
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSumTransaction {
    double totalSum = 0.0;
    for (var i = 0; i < transactions.length; i++)
      totalSum += transactions[i].cost;

    return totalSum;
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransaction
              .map((e) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                      label: e['day'],
                      spendingAmount: e['amount'],
                      totalSpendingAmount: totalSumTransaction,
                    ),
              ))
              .toList(),
        ),
      ),
    );
  }

  bool _datesAreEqual(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }
}
