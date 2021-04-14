import 'package:flutter/material.dart';
import 'package:decide_hackathon/main.dart';
import 'package:decide_hackathon/widget/add_product_dialog_widget.dart';
import 'package:decide_hackathon/widget/expired_list_widget.dart';
import 'package:decide_hackathon/widget/product_list_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ProductListWidget(),
      ExpiredListWidget(),
    ];

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
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
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddProductWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

