import 'package:decide_hackathon/page/home_page.dart';
import 'package:decide_hackathon/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  static final String title = 'Storage App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ProductProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Color(0xFFf6f5ee),
      ),
      home: HomePage(),
    ),
  );
}