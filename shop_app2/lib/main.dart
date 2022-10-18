import 'package:flutter/material.dart';
import 'package:shop_app2/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.teal, accentColor: Colors.deepOrange),
      home: ProductsOverviewScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop")),
      body: Center(child: Text("Let's Build App")),
    );
  }
}
