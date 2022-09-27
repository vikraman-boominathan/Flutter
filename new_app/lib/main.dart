// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:new_app/transaction.dart';

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
    final List<Transaction> transactionList = [
      Transaction(
        id: "t1",
        title: "Headphones",
        amount: 200.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: "t2",
        title: "Shoes",
        amount: 201.89,
        date: DateTime.now(),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to flutter"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // width: double.infinity,
            child: Card(
              elevation: 10,
              color: Colors.deepOrange,
              child: Text(
                "Hello",
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [TextField(), TextField()],
              ),
            ),
          ),
          Column(
            children: transactionList
                .map(
                  (e) => Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 4,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                              style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              // e.amount.toString(),
                              "\$${e.amount}" // String interpolation - "$" is a hold unique meaning to it so it cannot be treated as a common notation. "\ - backslash" is used to escape that notation
                              ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              e.title,
                            ),
                            Text(
                                style: TextStyle(color: Colors.grey),
                                // DateFormat("dd-MM-yyyy").format(e.date)  #one way of configuring the date format by manually giving the type of the date format
                                DateFormat.yMMMMd().format(e.date))
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
