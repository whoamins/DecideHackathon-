import 'dart:io';
import 'dart:async';
import 'package:decide_hackathon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager instance = DatabaseManager._instance();
  static Database _db;

  DatabaseManager._instance();

  String productTable = "products_table";
  String colId = "id";
  String colTitle = "title";
  String colExpirationDate = "expirationDate";
  String colQuantity = "quantity";


  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'products.db';
    final productsListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return productsListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $productTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colExpirationDate TEXT, $colQuantity INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getProductMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(productTable);
    return result;
  }

  Future<List<Product>> getProductList() async {
    final List<Map<String, dynamic>> productMapList = await getProductMapList();
    final List<Product> productsList = [];
    productMapList.forEach((productMap) {
      productsList.add(Product.fromMap(productMap));
    });
    return productsList;
  }

  Future<int> insertProduct(Product product) async {
    Database db = await this.db;
    final int result = await db.insert(
      productTable,
      product.toMap(),
    );
    return result;
  }

  Future<int> updateProduct(Product product) async {
    Database db = await this.db;
    final int result = await db.update(
      productTable,
      product.toMap(),
      where: '$colId = ?',
      whereArgs: [product.id],
    );
    return result;
  }

  Future<int> deleteProduct(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
        productTable,
        where: '$colId = ?',
        whereArgs: [id]
    );
    return result;
  }
}
