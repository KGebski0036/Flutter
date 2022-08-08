import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar({this.label, this.spendingAmount, this.totalSpendingAmount});

  final String label;
  final double spendingAmount;
  final double totalSpendingAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18,
          child: FittedBox(
            child: Text(
              '\$${spendingAmount.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 217, 217, 217),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingAmount / (totalSpendingAmount != 0
                    ? totalSpendingAmount
                    : 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
