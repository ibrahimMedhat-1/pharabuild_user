import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/medicine/manager/medicine_cubit.dart';

import '../../home_page/view/widget/home_page_search.dart';
import '../../pharmacy_details/view/products_details.dart';
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
                  const SliverAppBar(
                    pinned: true,
                    collapsedHeight: 80,
                    flexibleSpace: HomePageSearchWidget(),
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
