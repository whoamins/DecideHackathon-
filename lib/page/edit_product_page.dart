import 'package:decide_hackathon/widget/app_bar.dart';
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
  String quantity;

  @override
  void initState() {
    super.initState();
    title = widget.product.title;
    quantity = widget.product.quantity;
  }


  @override
  Widget build(BuildContext) => Scaffold(
    appBar: GradientAppBar(
        title: 'STORAGE',
        gradientBegin: Color(0xff7f00ff),
        gradientEnd: Color(0xffe100ff),
    ),
    body: Padding(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: ProductFormWidget(
          title: title,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedQuantity: (quantity) => setState(() => this.quantity = quantity),
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
