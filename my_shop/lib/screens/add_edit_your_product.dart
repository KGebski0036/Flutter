import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';

import 'poduct_detail.dart';

class AddEditYourProductScreen extends StatefulWidget {
  static final routeName = '/edit_product';

  @override
  State<AddEditYourProductScreen> createState() =>
      _AddEditYourProductScreenState();
}

class _AddEditYourProductScreenState extends State<AddEditYourProductScreen> {
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _isInit = false;
  var _initValues = {
    'title': '',
    'price': '',
    'description': '',
  };

  Product _editedProduct =
      Product(id: null, title: null, price: null, imageUrl: null);

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      var productFromArg = ModalRoute.of(context).settings.arguments as Product;

      if (productFromArg != null) {
        _editedProduct = productFromArg;

        _initValues = {
          'title': _editedProduct.title,
          'price': _editedProduct.price.toString(),
          'description': _editedProduct.description,
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }

    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveForm,
          )
        ],
      ),
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: ListView(children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Name of product'),
                maxLength: 25,
                textInputAction: TextInputAction.next,
                onSaved: ((newValue) => _editedProduct = Product(
                      id: _editedProduct.id,
                      title: newValue,
                      price: _editedProduct.price,
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      isFavorite: _editedProduct.isFavorite,
                    )),
                validator: ((value) {
                  if (value.isEmpty) return 'Title can not be empty';
                  return null;
                }),
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: ((newValue) => _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      price: double.parse(newValue),
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      isFavorite: _editedProduct.isFavorite,
                    )),
                validator: ((value) {
                  if (value.isEmpty) return 'Price can not be empty';
                  if (double.tryParse(value) == null)
                    return 'Enter a valid number';
                  if (double.parse(value) < 0) return 'Enter a postive number';
                  return null;
                }),
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLength: 1000,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onSaved: ((newValue) => _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      description: newValue,
                      imageUrl: _editedProduct.imageUrl,
                      isFavorite: _editedProduct.isFavorite,
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Container()
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.fill,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _initValues['imageUrl'],
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) {
                        saveForm();
                      },
                      onSaved: ((newValue) => _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: newValue,
                            isFavorite: _editedProduct.isFavorite,
                          )),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void saveForm() {
    if (_form.currentState.validate()) {
      _form.currentState.save();

      if (_editedProduct.id != null) {
        Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct.id, _editedProduct);
      } else {
        _editedProduct = Product(
          id: DateTime.now().toString(),
          title: _editedProduct.title,
          price: _editedProduct.price,
          description: _editedProduct.description,
          imageUrl: _editedProduct.imageUrl,
        );
        Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      }

      Navigator.of(context).pushReplacementNamed('/');
      Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
          arguments: _editedProduct.id);
    }
  }
}
