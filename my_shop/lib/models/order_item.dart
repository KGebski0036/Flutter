import 'package:flutter/foundation.dart';

import 'cart_item.dart';

class OrderItem {
  final String id;
  final double totalCost;
  final List<CartItem> products;
  final DateTime timeOfTransaction;

  OrderItem({
    @required this.id,
    @required this.totalCost,
    @required this.products,
    @required this.timeOfTransaction,
  });
}
