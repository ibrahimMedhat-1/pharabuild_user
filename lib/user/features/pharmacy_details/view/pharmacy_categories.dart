import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/products_details.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/carousel_item.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

import '../../../../authentication/view/widgets/custom_text_form.dart';
import '../manager/pharmacy_categories_cubit/pharmacy_categories_cubit.dart';

class PharmacyCategoriesPage extends StatelessWidget {
  final String categoryName;
  final String tag;

  const PharmacyCategoriesPage({
    super.key,
    required this.categoryName,
    required this.tag,
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
                        categoryName,
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
                    children: cubit.categories
                        .asMap()
                        .entries
                        .map((e) => ProductItem(
                              tag: cubit.categories[e.key].tag!,
                              productImage: cubit.categories[e.key].productImage!,
                              productName: cubit.categories[e.key].productName!,
                              productPrice: cubit.categories[e.key].productPrice!,
                              productDescription: cubit.categories[e.key].productDescription!,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => ProductsDetails(
                                        tag: cubit.categories[e.key].tag!,
                                        image: cubit.categories[e.key].productImage!,
                                        productName: cubit.categories[e.key].productName!,
                                        productPrice: cubit.categories[e.key].productPrice!,
                                        productDescription: cubit.categories[e.key].productDescription!,
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
