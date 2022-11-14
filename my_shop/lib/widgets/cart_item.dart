import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CardItemCart extends StatelessWidget {
  final String id;
  final String idInCard;
  final double price;
  final int quantity;
  final String title;

  CardItemCart({
    @required this.id,
    @required this.idInCard,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(idInCard);
      },
      confirmDismiss: (_) => showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Remove product'),
                content: Text('Are you sure you want to remove whole product?'),
                actions: [
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.error),
                  ),
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ],
              ))),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(child: Text('\$ ' + price.toString())),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$' + (price * quantity).toString()),
            trailing: Text(quantity.toString() + ' x'),
          ),
        ),
      ),
    );
  }
}
