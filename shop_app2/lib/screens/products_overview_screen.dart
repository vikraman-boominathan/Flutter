import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, ShowAll }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) => print(selectedValue),
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Fav'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.ShowAll,
              )
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
