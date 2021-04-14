import 'package:decide_hackathon/widgets/product_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddProductDialogWidget extends StatefulWidget {
  @override
  _AddProductDialogWidgetState createState() => _AddProductDialogWidgetState();
}


class _AddProductDialogWidgetState extends State<AddProductDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String expirationDate = '';
  String quantity = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Добавить товар',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8),
        ProductFormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedExpirationDate: (expirationDate) => setState(() => this.expirationDate = expirationDate),
          onChangedQuantity: (quantity) => setState(() => this.quantity = quantity),
          onSavedProduct: () {},
        ),
      ],
    ),
  );
}

