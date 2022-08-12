import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context).settings.arguments as String;
    final Product product = Provider.of<Products>(context, listen: false).findById(ProductId);

    if (product == null) return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
