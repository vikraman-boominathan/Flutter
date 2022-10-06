// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New App")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 100, color: Colors.red, child: Text("Item 1 - Pretty big")),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
                height: 100, color: Colors.blueGrey, child: Text("Item 2")),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
                height: 100, color: Colors.deepPurple, child: Text("Item 3")),
          ),
        ],
      ),
    );
  }
}
