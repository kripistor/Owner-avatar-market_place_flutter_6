import 'package:flutter/material.dart';
import 'package:market_place_flutter_e/pages/product_detail.dart';
import 'package:market_place_flutter_e/pages/add_product.dart';
import '../models/product_model.dart';
import '../components/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Market Place', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: products[index]),
                ),
              );
            },
            child: Item(
              product: products[index],
              onDelete: () {
                setState(() {
                  products.removeAt(index);
                });
              },
              onToggleFavorite: () {
                setState(() {
                  products[index].isFavorite = !products[index].isFavorite; // Изменение статуса избранного
                });
              },
              isLeftColumn: index % 2 == 0,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductPage(),
            ),
          ).then((newProduct) {
            if (newProduct != null) {
              setState(() {
                products.add(newProduct);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
