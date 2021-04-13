import 'package:decide_hackathon/db/db.dart';
import 'package:decide_hackathon/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class AddProductScreen extends StatefulWidget {

  final Product product;

  AddProductScreen({this.product});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _product;
  int _quantity;
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat("MMM dd, yyyy");
  final List<String> _products = ['Молоко', 'Сметана', 'Кефир'];

  @override
  void initState() {
    super.initState();

    if (widget.product != null) {
      _title = widget.product.title;
      _date = widget.product.expirationDate;
      _quantity = widget.product.quantity;
    }

    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _submit() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("$_title, $_date, $_product");

      Product product = Product(title: _title, expirationDate: _date, quantity: _quantity);
      if (widget.product == null) {
        DatabaseManager.instance.insertProduct(product);
      } else {
        DatabaseManager.instance.updateProduct(product);
      }


      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Новый товар',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: DropdownButtonFormField(
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconSize: 22.0,
                          iconEnabledColor: Theme.of(context).primaryColor,
                          items: _products.map((String product) {
                            return DropdownMenuItem(
                              value: product,
                              child: Text(
                                product,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            );
                          }).toList(),
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: 'Товар',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => _product == null ? 'Укажите товар' : null,
                          onSaved: (input) => _product = input,
                          onChanged: (value) {
                            setState(() {
                              _product = value;
                            });
                          },
                          value: _product,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          style: TextStyle(fontSize: 18.0),
                          onTap: _handleDate,
                          decoration: InputDecoration(
                            labelText: 'Срок годности',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: 'Количество',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) =>
                              input.trim().isEmpty ? 'Укажите количество!' : null,
                          onSaved: (input) => _title = input,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: FlatButton(
                          child: Text(
                            'Добавить',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: FlatButton(
                          child: Text(
                            'Сканировать Штрих-Код',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: FlatButton(
                          child: Text(
                            'Сканировать QR-Код',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: _submit,
                        ),
                       ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
