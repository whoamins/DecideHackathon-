import 'package:decide_hackathon/db/db.dart';
import 'package:decide_hackathon/models/product.dart';
import 'package:decide_hackathon/screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  Future<List<Product>> _productList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateProductList();
  }

  _updateProductList() {
    setState(() {
      _productList = DatabaseManager.instance.getProductList();
    });
  }

  Widget _buildTask(Product product) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget> [
          ListTile(
              title: Text(
                product.title,
                style: TextStyle(
                    fontSize: 15.0,
                    decoration: product.isExpired == 0
                        ? TextDecoration.none
                        : TextDecoration.overline
                ),
              ),
              subtitle:
                  Text('Срок годности: ${_dateFormatter.format(product.expirationDate)} | Осталось: ${product.quantity}')),

          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _productList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final int expiredProductsCount = snapshot.data
              .where((Product product) => product.isExpired == 1)
              .toList()
              .length;

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            itemCount: 1 + snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Хранилище',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '$expiredProductsCount of 0',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }
              return _buildTask(snapshot.data[index - 1]);
            },
          );
        },
      ),
    );
  }
}
