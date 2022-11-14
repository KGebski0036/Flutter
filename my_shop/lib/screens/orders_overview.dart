import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/order_card.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/app_navigation.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
      body: ListView.builder(itemCount: orders.length, itemBuilder: ((context, index) => OrderCard(orders[index])),),
      drawer: AppNavigation(),
    );
  }
}
