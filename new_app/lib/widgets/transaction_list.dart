// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, empty_constructor_bodies, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: transactions
          .map(
            (e) => Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
    ));
  }
}
