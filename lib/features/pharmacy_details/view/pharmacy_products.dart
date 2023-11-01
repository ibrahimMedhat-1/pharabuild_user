import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/manager/pharmacy_products_cubit/pharmacy_products_cubit.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/products_details.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/widgets/pharmacy_products_widgets/carousel_item.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

class PharmacyProductsPage extends StatelessWidget {
  const PharmacyProductsPage({super.key});

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
                            items: [
                              dropDownItem(context, 'Medicine'),
                              dropDownItem(context, 'Skin Care'),
                              dropDownItem(context, 'Medical Aid'),
                            ],
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
                    children: cubit.products
                        .asMap()
                        .entries
                        .map((e) => ProductItem(
                              tag: cubit.products[e.key].tag!,
                              productImage: cubit.products[e.key].productImage!,
                              productName: cubit.products[e.key].productName!,
                              productPrice: cubit.products[e.key].productPrice!,
                              productDescription: cubit.products[e.key].productDescription!,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => ProductsDetails(
                                        tag: cubit.products[e.key].tag!,
                                        image: cubit.products[e.key].productImage!,
                                        productName: cubit.products[e.key].productName!,
                                        productPrice: cubit.products[e.key].productPrice!,
                                        productDescription: cubit.products[e.key].productDescription!,
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
