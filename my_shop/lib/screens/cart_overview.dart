import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/orders_overview.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/app_navigation.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      drawer: AppNavigation(),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 40,
                  ),
                  Chip(
                    label: Text('\$ ' + cart.totalCost.toStringAsFixed(2)),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalCost,
                      );
                      cart.clearCart();
                      Navigator.of(context).pushNamed(OrdersScreen.routeName);
                    },
                    child: Text('Order now'),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => CardItemCart(
              id: cart.items.values.toList()[index].id,
              title: cart.items.values.toList()[index].title,
              idInCard: cart.items.keys.toList()[index],
              quantity: cart.items.values.toList()[index].quantity,
              price: cart.items.values.toList()[index].price),
          itemCount: cart.itemsCount,
        ))
      ]),
    );
  }
}
