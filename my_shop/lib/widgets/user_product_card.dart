import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/providers/product.dart';
import 'package:flutter_complete_guide/screens/add_edit_your_product.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductCard extends StatelessWidget {
  final Product product;

  UserProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.title),
        leading: CircleAvatar(
          backgroundImage: product.imageUrl.isEmpty
              ? AssetImage('assets/img/empty.jpg')
              : NetworkImage(product.imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.of(context).pushNamed(
                    AddEditYourProductScreen.routeName,
                    arguments: product);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<Products>(context, listen: false).deleteProduct(product.id);
              },
              color: Theme.of(context).colorScheme.error,
            ),
          ]),
        ),
      ),
    );
  }
}
