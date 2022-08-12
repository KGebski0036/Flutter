import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';

import 'screens/poduct_detail.dart';
import 'screens/products_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Color.fromARGB(224, 58, 180, 10),
              onPrimary: Color.fromARGB(223, 56, 131, 27),
              secondary: Color.fromARGB(223, 117, 201, 8),
              onSecondary: Color.fromARGB(223, 152, 230, 51),
              error: Color.fromARGB(223, 231, 54, 22),
              onError: Color.fromARGB(223, 240, 43, 8),
              background: Color.fromARGB(223, 137, 7, 163),
              onBackground: Color.fromARGB(223, 116, 7, 138),
              surface: Color.fromARGB(223, 7, 138, 62),
              onSurface: Color.fromARGB(223, 56, 238, 132),
            ),
            fontFamily: 'Pemenen'),
        home: ProuctsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: ((context) => ProductDetailScreen())
        },
      ),
    );
  }
}
