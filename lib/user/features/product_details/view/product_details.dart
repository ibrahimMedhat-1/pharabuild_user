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
              title: const Text('Product Details'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 400,
                                child: Image.network(product.image!)),
                          ),
                          const SizedBox(height: 16.0),
                          Text("Product Name : ${product.name!}",
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Price: ${product.price!} LE',
                            style: const TextStyle(fontSize: 16.0),
                          ),


                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration:  BoxDecoration(
                        color: Colors.amberAccent.shade100,
                        borderRadius: const BorderRadius.only(
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
                          child: const Text("add to cart"),
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