import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decide_hackathon/model/product.dart';
import 'package:decide_hackathon/utils.dart';
import 'package:firebase_core/firebase_core.dart';


class FirebaseApi {
  static Future<String> createProduct(Product product) async {
    final docProduct = FirebaseFirestore.instance.collection('product').doc();

    product.id = docProduct.id;
    await docProduct.set(product.toJson());

    return docProduct.id;
  }

  static Stream<List<Product>> readProducts() =>
      FirebaseFirestore.instance
          .collection('product')
          .orderBy(ProductField.createdTime, descending: true)
          .snapshots()
          .transform(Utils.transformer(Product.fromJson));

  static Future updateProduct(Product product) async {
    final docProduct = FirebaseFirestore.instance.collection('product').doc(product.id);

    await docProduct.update(product.toJson());
  }
}