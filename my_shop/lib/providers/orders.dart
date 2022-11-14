import 'package:flutter/cupertino.dart';

import '../models/cart_item.dart';
import '../models/order_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double totalCost) {
    _orders.add(
      OrderItem(
        id: DateTime.now().toString(),
        totalCost: totalCost,
        products: cartItems,
        timeOfTransaction: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
