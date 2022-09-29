// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/user_transactions.dart';
import './models/transaction.dart';

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
    // final String titleInput;
    // // final String amountInput;
    // final titleController = TextEditingController();
    // final amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to flutter"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
