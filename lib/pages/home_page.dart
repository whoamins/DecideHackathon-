import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:decide_hackathon/main.dart';
import 'package:decide_hackathon/widgets/add_product_dialog_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    final tabs = [
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(appBar: AppBar(
        title: Text(MyApp.title),
      ),
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
            label: 'Продукты'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Просроченные'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Купить'
          ),
        ]
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddProductDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add)
      ),
    );
  }
}