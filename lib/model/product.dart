import 'package:flutter/cupertino.dart';


class ProductField {
  static const createdTime = 'createdTime';
}


class Product {
  DateTime createdTime;
  String title;
  String id;
  int quantity;
  DateTime expirationDate;
  bool isExpired;

  Product({
    @required this.createdTime,
    @required this.title,
    @required this.quantity,
    @required this.expirationDate,
    this.id,
    this.isExpired = false,
 });
}