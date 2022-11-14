import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/widgets/app_navigation.dart';
import 'package:flutter_complete_guide/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import 'cart_overview.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProuctsOverviewScreen extends StatefulWidget {
  @override
  State<ProuctsOverviewScreen> createState() => _ProuctsOverviewScreenState();
}

class _ProuctsOverviewScreenState extends State<ProuctsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Zakupy z G'),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == FilterOptions.Favorites)
                    _showOnlyFavorites = true;
                  else
                    _showOnlyFavorites = false;
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ],
              icon: Icon(Icons.more_vert)),
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: cart.itemsCount.toString()),
          )
        ],
      ),
      drawer: AppNavigation(),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
