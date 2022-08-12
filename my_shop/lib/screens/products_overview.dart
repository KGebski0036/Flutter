import 'package:flutter/material.dart';

import '../providers/products.dart';
import '../widgets/products_grid.dart';

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
        ],
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
