import 'package:decide_hackathon/api/firebaseApi.dart';
import 'package:decide_hackathon/model/product.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:decide_hackathon/main.dart';
import 'package:decide_hackathon/widget/add_product_dialog_widget.dart';
import 'package:decide_hackathon/widget/expired_list_widget.dart';
import 'package:decide_hackathon/widget/product_list_widget.dart';
import 'package:decide_hackathon/widget/app_bar.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ProductListWidget(),
      ExpiredListWidget(),
    ];

    return Scaffold(
      appBar: GradientAppBar(
        title: 'ХРАНИЛИЩЕ',
        gradientBegin: Color(0xff7f00ff),
        gradientEnd: Color(0xffe100ff),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff7f00ff),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Продукты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 28),
            label: 'Купить',
          ),
        ],
      ),
      /*
      body: StreamBuilder<List<Product>>(
        stream: FirebaseApi.readProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if(snapshot.hasError) {
                return buildText('Что-то не так...');
              } else {
                final products = snapshot.data;
                final provider = Provider.of<ProductProvider>(context);

                provider.setProducts(products);

                return tabs[selectedIndex];
              }
          }
        },
      ),
       */
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xff7f00ff),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddProductWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

Widget buildText(String text) => Center(
  child: Text(
    text,
    style: TextStyle(fontSize: 24, color: Colors.white),
  ),
);

