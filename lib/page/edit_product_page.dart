import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:decide_hackathon/model/product.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:decide_hackathon/widget/product_form_widget.dart';


class EditProductPage extends StatefulWidget {
  final Product product;

  const EditProductPage({
    Key key,
    @required this.product
 }) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}


class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  int quantity;

  @override
  void initState() {
    super.initState();

    title = widget.product.title;
  }

  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      title: Text('Измкнеиечя'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider = Provider.of<ProductProvider>(context, listen: false);
            provider.removeProduct(widget.product);

            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ProductFormWidget(
          title: title,
          onChangedTitle: (title) => setState(() => this.title = title),
          onSavedProduct: saveProduct,
        ),
      ),
    )
  );

  void saveProduct() {
    final isValid = _formKey.currentState.validate();

    if(!isValid) {
      return;
    } else {
      final provider = Provider.of<ProductProvider>(context, listen: false);

      provider.updateProduct(widget.product, title, quantity);

      Navigator.of(context).pop();
    }
  }
}
