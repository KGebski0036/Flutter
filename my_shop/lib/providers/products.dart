import 'package:flutter/cupertino.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Czajnik',
      description: 'Czajnik na herbatkę :)',
      price: 29.99,
      imageUrl: 'https://images.obi.pl/product/PL/1500x1500/658963_1.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Bongo',
      description: 'Urzywane zamiennie z lornetką',
      price: 59.99,
      imageUrl:
          'https://a.assecobs.com/_img/b2c-main-promotorzy/51bf84e4-03a7-4e4c-8fee-85ce2b65b65d/fajka-bongo-83-szklana-wys-34cm-.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Lufka fifka',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://a.allegroimg.com/s1024/0c0fe8/713bc94944b5befbd1e9c42585bd',
    ),
    Product(
      id: 'p4',
      title: 'Wiadro',
      description: 'Wale adro nagle zdrowy',
      price: 49.99,
      imageUrl:
          'https://static02.leroymerlin.pl/files/media/image/907/2212907/product/main.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    var x = items.where((element) => element.isFavorite).toList();
    return x;
  }

  void addProduct(Product value) {
    _items.add(value);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere(((element) => id == element.id));
  }

  void updateProduct(String id, Product newProduct) {
    var prodIndex = _items.indexWhere((element) => element.id == id);
    _items[prodIndex] = newProduct;
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
