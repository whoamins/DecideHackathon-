import 'package:flutter/cupertino.dart';
import 'package:decide_hackathon/model/product.dart';
import 'package:flutter/rendering.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> _products = [
    Product(
        createdTime: DateTime.now(),
        title: 'qwe',
        quantity: 1,
    )
  ];

  List<Product> get products => _products.where((product) => product.isExpired == false).toList();

  List<Product> get expiredProducts =>
      _products.where((product) => product.isExpired == true).toList();

  void addProduct(Product product)
  {
    _products.add(product);

    notifyListeners();
  }

  void removeProduct(Product product)
  {
    _products.remove(product);

    notifyListeners();
  }

  bool toggleProductStatus(Product product)
  {
    product.isExpired = !product.isExpired;
    notifyListeners();

    return product.isExpired;
  }

  void updateProduct(Product product, String title, int quantity) {
    product.title = title;
    product.quantity = quantity;
    notifyListeners();
  }
}