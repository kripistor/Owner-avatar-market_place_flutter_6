import 'package:flutter/material.dart';
import 'package:market_place_flutter_e/models/product_model.dart';
import 'package:market_place_flutter_e/pages/product_detail.dart';

class FavoritesPage extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritesPage({Key? key, required this.favoriteProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Избранные', style: TextStyle(color: Colors.black))),
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('Нет избранных товаров'))
          : ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteProducts[index].name),
            subtitle: Text('${favoriteProducts[index].price} рублей'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: favoriteProducts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
