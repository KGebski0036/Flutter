import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order_item.dart';

class OrderCard extends StatefulWidget {
  final OrderItem order;

  OrderCard(this.order);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final products = widget.order.products;

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.order.totalCost.toString() + ' \$'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.order.timeOfTransaction)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(products.length * 20.0 + 50, 150),
              child: ListView.builder(
                itemBuilder: ((context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          products[index].title,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          products[index].price.toString() + ' \$ ' + ' x ' + products[index].quantity.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    )),
                itemCount: products.length,
              ),
            )
        ],
      ),
    );
  }
}
