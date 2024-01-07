import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/products_details.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/carousel_item.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

import '../../../../authentication/view/widgets/custom_text_form.dart';
import '../manager/pharmacy_categories_cubit/pharmacy_categories_cubit.dart';

class PharmacyCategoriesPage extends StatelessWidget {
  final String tag;
  final List<ProductsModel> products;

  const PharmacyCategoriesPage({
    super.key,
    required this.tag,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyCategoriesCubit(),
      child: BlocConsumer<PharmacyCategoriesCubit, PharmacyCategporiesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyCategoriesCubit cubit = PharmacyCategoriesCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Hero(
                      tag: tag,
                      child: Text(
                        tag,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SliverAppBar(
                    leading: const SizedBox(),
                    collapsedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CarouselSlider(
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
                  ),
                  SliverAppBar(
                    leading: const SizedBox(),
                    pinned: true,
                    expandedHeight: 100,
                    collapsedHeight: 100,
                    surfaceTintColor: Colors.white,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextForm(
                        controller: cubit.searchController,
                        obscure: false,
                        labelText: 'Search',
                        hintText: 'Search for an item',
                      ),
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 2,
                    children: products
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
