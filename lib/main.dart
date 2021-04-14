import 'package:decide_hackathon/pages/home_page.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  static final String title = 'Хранилище';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Color(0xFFf6f5ee),
    ),
    home: HomePage(),
  );
}