// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, empty_constructor_bodies, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transaction added yet",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              // child: Column(
              //     children: transactions
              //   .map(
              //     (e) =>
              itemBuilder: ((context, index) {
                return Card(
                   elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('₹${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () =>deleteTx(transactions[index].id),),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 4,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           "\$${transactions[index].amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //           ),
                //           // e.amount.toString(),
                //           // String interpolation - "$" is a hold unique meaning to it so it cannot be treated as a common notation. "\ - backslash" is used to escape that notation
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.bodyText2,
                //           ),
                //           Text(
                //             DateFormat.yMMMMd()
                //                 .format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //             // DateFormat("dd-MM-yyyy").format(e.date)  #one way of configuring the date format by manually giving the type of the date format
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
              }),
              itemCount: transactions.length,
            ),
    );
  }
}
