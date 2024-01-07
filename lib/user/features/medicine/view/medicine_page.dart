import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/medicine/manager/medicine_cubit.dart';

import '../../home_page/view/widget/home_page_search.dart';
import '../../pharmacy_details/view/products_details.dart';
import '../../pharmacy_details/view/widgets/pharmacy_products_widgets/carousel_item.dart';
import '../../pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicineCubit(),
      child: BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {},
        builder: (context, state) {
          final MedicineCubit cubit = MedicineCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CarouselSlider(
                      items: const [
                        CarouselItem(image: 'assets/test/medicine_offers1.jpeg'),
                        CarouselItem(image: 'assets/test/medicine_offers2.jpeg'),
                        CarouselItem(image: 'assets/test/medicine_offers3.jpeg'),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  const SliverAppBar(
                    collapsedHeight: 80,
                    floating: true,
                    flexibleSpace: HomePageSearchWidget(),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: cubit.products
                        .asMap()
                        .entries
                        .map((e) => ProductItem(
                              tag: e.value.tag!,
                              productImage: e.value.image!,
                              productName: e.value.name!,
                              productPrice: e.value.price!,
                              productDescription: e.value.description!,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => ProductsDetails(
                                        tag: e.value.tag!,
                                        productsModel: e.value,
                                      ),
                                    ));
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

DropdownMenuItem<String> dropDownItem(BuildContext context, String value) {
  return DropdownMenuItem(
    value: value,
    child: Text(
      value,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    ),
  );
}
