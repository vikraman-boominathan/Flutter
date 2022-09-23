import 'package:flutter/material.dart';

import './textchange.dart';
import './textcontrol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var changeIndex = 0;

  void changeText() {
    setState(() {
      changeIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var changeTextInner = ["Hello World!", "Welcome to Flutter"];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Welcome to flutter"),
      ),
      body: Column(
        children: [
          TextChange(changeTextInner[changeIndex]),
          TextControl(changeText)
        ],
      ),
    ));
  }
}
