import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.teal.shade800,
        accentColor: Colors.amber,
      ),
      home: GreatPlacesApp(),
    );
  }
}

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
