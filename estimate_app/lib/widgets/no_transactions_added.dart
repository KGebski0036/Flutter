import 'package:flutter/material.dart';

class NoTransactionsAdded extends StatelessWidget {
  const NoTransactionsAdded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 135,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty.png'),
          Text('no transactions added', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
