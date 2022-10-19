import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context, listen: false)
        .findById(productId); //will give us the id
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
