import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacrions;
  final Function deleteTransaction;

  TransactionList(this.transacrions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transacrions.map((e) => TarnsactionCard(e, deleteTransaction)).toList(),
    );
  }
}
