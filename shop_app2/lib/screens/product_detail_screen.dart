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
      // appBar: AppBar(title: Text(loadedProduct.title)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${loadedProduct.price}",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 800,
                )
              ],
            ),
          )
        ],
        // child: Column(
        //   children: [
        //     Container(
        //       height: 300,
        //       width: double.infinity,
        //       child:
        //     ),
        // ],
      ),
    );
  }
}
