import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';

import '../manager/product_details_cubit.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ProductDetailsCubit cubit = ProductDetailsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Product Details'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 250,
                        child: Image.network(product.image!)),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    product.name!,
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Price: ${product.price!} LE',
                    style: TextStyle(fontSize: 16.0),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        MaterialButton(
                          height: MediaQuery.sizeOf(context).width * 0.1,
                          textColor: Colors.white,
                          color: Colors.blueAccent,
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                           cubit.addToCart(product);
                          },
                          child: Text("add to cart"),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}