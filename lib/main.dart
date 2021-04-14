import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  static final String title = 'Холодильник';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Color(0xFFf6f5ee),
    ),
    home: HomePage();
  );
}