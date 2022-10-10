// ignore_for_file: prefer_const_constructors, sdk_version_constructor_tearoffs, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String res, text ="";
  int first, second;
  String opp;
  void btnClicked(String btnText){
    if (btnText == "C"){
      res = "";
      text = "";
      first = 0;
      second  = 0;
    } else if(btnText == "+" || btnText == "-" || btnText == "*" || btnText == "/" ){
      first = int.parse(text);
      res = "";
      opp = btnText;
    }else if(btnText == "="){
      second = int.parse(text);
      if(opp == "+"){
        res = (first + second).toString();
      }

      if(opp == "-"){
        res = (first - second).toString();
      }

      if(opp == "*"){
        res = (first * second).toString();
      }

      if(opp == "/"){
        res = (first / second).toString();
      }
    }
    else{
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }


  outlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(25),
                    shape: BeveledRectangleBorder()),
                onPressed: () => btnClicked(val),
                child: Text(val, style: TextStyle(fontWeight: FontWeight.w900)),
              ),
    );
  }
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Row(
            children: [
              outlinedButton("9"),
              outlinedButton("8"),
              outlinedButton("7"),
              outlinedButton("+"),
            ],
          ),
          Row(
            children: [
              outlinedButton("6"),
              outlinedButton("5"),
              outlinedButton("4"),
              outlinedButton("-"),
            ],
          ),
          Row(
            children: [
              outlinedButton("3"),
              outlinedButton("2"),
              outlinedButton("1"),
              outlinedButton("*"),
            ],
          ),
          Row(
            children: [
              outlinedButton("C"),
              outlinedButton("0"),
              outlinedButton("="),
              outlinedButton("/"),
            ],
          ),
        ],),
      ),
    );
  }

}