import 'package:decide_hackathon/model/product.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:decide_hackathon/widget/product_form_widget.dart';
import 'package:provider/provider.dart';


class AddProductWidget extends StatefulWidget {
  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String quantity;
  String expirationDate;

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Добавить',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8),
        ProductFormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedQuantity: (quantity) => setState(() => this.quantity = quantity),
          onChangedExpirationDate: (expirationDate) => setState(() => this.expirationDate = expirationDate),
          onSavedProduct: addProduct,
        )
      ],
    ),
  );

  void addProduct() {
    final product = Product(
      id: DateTime.now().toString(),
      title: title,
      quantity: quantity,
      expirationDate: expirationDate,
      createdTime: DateTime.now(),
    );

    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.addProduct(product);

    Navigator.of(context).pop();
  }
}
