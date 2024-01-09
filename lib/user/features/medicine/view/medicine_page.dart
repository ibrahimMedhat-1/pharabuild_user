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
      create: (context) => MedicineCubit()
        ..getAllProducts()
        ..getAllOffers(),
      child: BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {},
        builder: (context, state) {
          final MedicineCubit cubit = MedicineCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (cubit.offers.isNotEmpty)
                    SliverToBoxAdapter(
                      child: state is GetAllOffersLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CarouselSlider(
                              items:
                                  cubit.offers.asMap().entries.map((e) => CarouselItem(image: e.value.image!)).toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                              ),
                            ),
                    ),
                  SliverAppBar(
                    collapsedHeight: 80,
                    floating: true,
                    flexibleSpace: SearchWidget(
                      controller: cubit.searchController,
                      search: () {
                        cubit.searchMedicine(cubit.searchController.text);
                      },
                      onChange: (value) {
                        if (value.isEmpty) {
                          cubit.isSearching(false);
                        } else {
                          cubit.isSearching(true);
                        }
                      },
                    ),
                  ),
                  if (state is GetAllMedicineProductsLoading)
                    const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
                  else
                    SliverGrid.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children:
                          (state is IsSearchingInMedicineInCategory ? cubit.searchMedicineProducts : cubit.products)
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
