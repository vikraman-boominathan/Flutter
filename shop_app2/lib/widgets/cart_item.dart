// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItem(this.id, this.price, this.productId, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      // ignore: missing_return
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          // ignore: prefer_const_constructors
          builder: (ctx) => AlertDialog(
            title: Text('Are you Sure'),
            content: Text(
              'Do you want ot remove the item from the cart?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
            ],
          ),
        );
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: FittedBox(child: Text("\$$price")),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total : \$${price * quantity}"),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
