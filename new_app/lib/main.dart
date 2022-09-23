// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to flutter"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 10,
              color: Colors.deepOrange,
              child: Text(
                "Hello",
              ),
            ),
          ),
          Card(
            child: Text(
              "List of Transx",
            ),
          )
        ],
      ),
    );
  }
}
