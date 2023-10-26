import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/features/payment/view/payment_page.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/manager/pharmacy_products_cubit/pharmacy_products_cubit.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/widgets/pharmacy_details_widget/top_image.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

class ProductsDetails extends StatelessWidget {
  final String tag;
  final String image;
  final String productName;
  final String productPrice;
  final String productDescription;

  const ProductsDetails({
    super.key,
    required this.tag,
    required this.image,
    required this.productPrice,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyProductsCubit(),
      child: BlocConsumer<PharmacyProductsCubit, PharmacyProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyProductsCubit productsCubit = PharmacyProductsCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopImageWidget(tag: tag, image: image),
                            Text(
                              productName,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    height: 2,
                                  ),
                            ),
                            Text(
                              productDescription,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'Similar Products',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    height: 3,
                                  ),
                            ),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              physics: const NeverScrollableScrollPhysics(),
                              children: productsCubit.similarProducts
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => ProductItem(
                                      tag: productsCubit.similarProducts[e.key].tag!,
                                      productImage: productsCubit.similarProducts[e.key].productImage!,
                                      productName: productsCubit.similarProducts[e.key].productName!,
                                      productPrice: productsCubit.similarProducts[e.key].productPrice!,
                                      productDescription: productsCubit.similarProducts[e.key].productDescription!,
                                      onTap: () {},
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomMoreProductsWidget(
                      text: '\$$productPrice',
                      buttonText: 'Buy',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const PaymentPage(),
                            ));
                      },
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
