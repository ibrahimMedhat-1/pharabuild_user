import 'package:flutter/material.dart';

import '../../../../../models/product_model.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductsModel> products;

  ProductsGridView({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // You can adjust the number of columns as per your design
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductsModel product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image ?? '', // Provide a placeholder or handle null
            height: 100.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Price: ${product.price ?? ''}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}