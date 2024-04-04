import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_model.dart';
import '../manager/my_products_cubit.dart';

class MyProductDetailPage extends StatelessWidget {
  final ProductsModel product;

  const MyProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductsCubit(),
      child: BlocConsumer<MyProductsCubit, MyProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MyProductsCubit cubit = MyProductsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 400,
                              child: Image.network(product.image!),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            "Product Name",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            initialValue: product.name ?? '',
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              cubit.onChangeName(value);
                            },
                            decoration: const InputDecoration(),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Price',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            initialValue: product.price ?? '',
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cubit.onChangePrice(value);
                            },
                            decoration: const InputDecoration(),
                          ),
                          const SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.center,
                            child:  ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                                    padding:
                                    MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 60))),
                                onPressed: () {
                                  cubit.updateProducts(
                                    product.tag!,
                                    product.name ?? '',
                                    product.price ?? '',
                                    context
                                  );
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}