import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/screens/add_edit_your_product.dart';
import 'package:flutter_complete_guide/widgets/app_navigation.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_card.dart';

class UserProductsScreen extends StatelessWidget {
  static final routeName = '/user_products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AddEditYourProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: ((context, index) =>
                  UserProductCard(products[index])))),
      drawer: AppNavigation(),
    );
  }
}
