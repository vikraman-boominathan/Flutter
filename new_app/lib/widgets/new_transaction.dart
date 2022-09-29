// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors


import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
      
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              // onChanged: (value) => amountInput = value,
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Add transaction"),
              onPressed: () {addTx(titleController.text, double.parse(amountController.text));},
            )
          ],
        ),
      ),
    );
  }
}
