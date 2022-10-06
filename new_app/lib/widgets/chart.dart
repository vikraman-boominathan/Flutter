// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return, unused_local_variable, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:new_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:new_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 2),
          'amount': totalSum
        };
      },
    ).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    }); //fold() - allows to change an list to another type with a certain logic
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    // ignore: prefer_const_constructors
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                maxSpending ==0.0 ? 0.0 : (data['amount'] as double) / maxSpending,
              ),
            ); //Text('${data['day']}: ${data['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
