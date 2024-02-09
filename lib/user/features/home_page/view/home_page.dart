import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/home_page/view/widget/home_page_search.dart';

import '../../../../authentication/view/widgets/welcome_widget.dart';
import '../manager/home_page_cubit.dart';

class PharmaciesPage extends StatelessWidget {
  const PharmaciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getProducts(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return SizedBox(
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
                return Container(
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
