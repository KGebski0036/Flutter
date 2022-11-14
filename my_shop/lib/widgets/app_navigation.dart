import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/orders_overview.dart';
import 'package:flutter_complete_guide/screens/user_products.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Navigation'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: (() {
                  Scaffold.of(context).closeDrawer();
                }),
                icon: Icon(Icons.arrow_back))
          ],
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: (() => Navigator.of(context).pushReplacementNamed('/')),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: (() => Navigator.of(context)
              .pushReplacementNamed(OrdersScreen.routeName)),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text('Your products'),
          onTap: (() => Navigator.of(context)
              .pushReplacementNamed(UserProductsScreen.routeName)),
        ),
      ]),
    );
  }
}
