import 'package:flutter/material.dart';

import 'package:decide_hackathon/screens/add_product_screen.dart';
import 'package:decide_hackathon/screens/main_page_screen.dart';


class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainPageScreen(),
    AddProductScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Главная'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
