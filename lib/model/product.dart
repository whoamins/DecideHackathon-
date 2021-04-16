import 'package:flutter/cupertino.dart';

import '../utils.dart';


class ProductField {
  static const createdTime = 'createdTime';
}


class Product {
  DateTime createdTime;
  String title;
  String quantity;
  String expirationDate;
  String id;
  bool isExpired;

  Product({
    @required this.createdTime,
    @required this.title,
    @required this.quantity,
    @required this.expirationDate,
    this.id,
    this.isExpired = false,
 });

  static Product fromJson(Map<String, dynamic> json) => Product(
    createdTime: Utils.toDateTime(json['createdTime']),
    title: json['title'],
    quantity: json['quantity'],
    id: json['id'],
    isExpired: json['isExpired'],
  );

  Map<String, dynamic> toJson() => {
    'createdTime': Utils.fromDateTimeToJson(createdTime),
    'title': title,
    'quantity': quantity,
    'expirationDate': expirationDate,
    'isExpired': isExpired
  };
}