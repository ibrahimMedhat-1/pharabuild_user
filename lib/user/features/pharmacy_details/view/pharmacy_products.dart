import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/pharmacy_model.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/products_details.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/carousel_item.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

import '../manager/pharmacy_products_cubit/pharmacy_products_cubit.dart';

class PharmacyProductsPage extends StatelessWidget {
  final PharmacyModel pharmacyModel;

  const PharmacyProductsPage(this.pharmacyModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyProductsCubit(),
      child: BlocConsumer<PharmacyProductsCubit, PharmacyProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyProductsCubit cubit = PharmacyProductsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (pharmacyModel.offers != null)
                    SliverToBoxAdapter(
                      child: CarouselSlider(
                        items: pharmacyModel.offers!
                            .asMap()
                            .entries
                            .map(
                              (e) => CarouselItem(image: e.value.banner!),
                            )
                            .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ),
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 100,
                    collapsedHeight: 100,
                    leading: const SizedBox(),
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          DropdownButton(
                            isExpanded: true,
                            value: cubit.dropDownMenuItemValue,
                            items: pharmacyModel.categories!
                                .asMap()
                                .entries
                                .map(
                                  (e) => dropDownItem(context, e.value.title!),
                                )
                                .toList(),
                            onChanged: (value) {
                              cubit.changeDropDownItem(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: pharmacyModel.products!
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
                                        tag: cubit.products[e.key].tag!,
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
}
