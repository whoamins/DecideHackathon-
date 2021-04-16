import 'package:decide_hackathon/api/firebaseApi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:decide_hackathon/model/product.dart';
import 'package:flutter/rendering.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products.where((product) => product.isExpired == false).toList();

  List<Product> get expiredProducts =>
      _products.where((product) => product.isExpired == true).toList();

  void setProducts(List<Product> products) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _products = products;
        notifyListeners();
      });

  void addProduct(Product product) {
    _products.add(product);

    notifyListeners();
  }

  void removeProduct(Product product)
  {
    _products.remove(product);

    notifyListeners();
  }

  void reduceProduct(Product product) {
    var index = _products.indexOf(product);
    products[index] = (int.tryParse(product.quantity) - 1).toString() as Product;

    notifyListeners();
  }

  bool toggleProductStatus(Product product)
  {
    product.isExpired = !product.isExpired;
    //FirebaseApi.updateProduct(product);
    notifyListeners();

    return product.isExpired;
  }

  void updateProduct(Product product, String title, String quantity) {
    product.title = title;
    product.quantity = quantity;
    notifyListeners();
    //FirebaseApi.updateProduct(product);
  }
}