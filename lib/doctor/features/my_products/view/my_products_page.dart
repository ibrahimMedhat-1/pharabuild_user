import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/my_products/manager/my_products_cubit.dart';

import 'my_products_details.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductsCubit()..getProducts(),
      child: BlocConsumer<MyProductsCubit, MyProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MyProductsCubit cubit = MyProductsCubit.get(context);
          return  Scaffold(
            appBar: AppBar(title: const Text("My Products"),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 800,
                child: GridView.builder(
                    itemCount: cubit.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var product = cubit.products[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductDetailPage(product: product)));

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                  child: Image.network(product.image!)),
                              const SizedBox(height: 10.0),
                              Text(
                               product.name!,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "price ${ product.price!} LE",

                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}
