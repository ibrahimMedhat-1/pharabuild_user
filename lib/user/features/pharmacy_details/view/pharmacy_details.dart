import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/utils/icons.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/pharmacy_products.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/category_item.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/review_item.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/top_image.dart';

import '../manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';

class PharmacyDetails extends StatelessWidget {
  final String image;
  final String tag;
  final String pharmacyName;
  final String pharmacyNo;

  const PharmacyDetails({
    super.key,
    required this.image,
    required this.tag,
    required this.pharmacyName,
    required this.pharmacyNo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyDetailsCubit(),
      child: BlocConsumer<PharmacyDetailsCubit, PharmacyDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyDetailsCubit cubit = PharmacyDetailsCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(child: TopImageWidget(tag: tag, image: image)),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pharmacyName,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.callPharmacy(pharmacyNo);
                          },
                          child: Text(
                            pharmacyNo,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoryItem(categoryName: 'Skin Care', icon: IconsAsset.skinCareCategory),
                            CategoryItem(categoryName: 'Medicines', icon: IconsAsset.medicineCategory),
                            CategoryItem(categoryName: 'First Aid', icon: IconsAsset.firstAidCategory),
                          ],
                        ),
                        Text(
                          'Reviews',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                height: 2,
                              ),
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ReviewItem(),
                              ReviewItem(),
                              ReviewItem(),
                            ],
                          ),
                        ),
                        const Spacer(),
                        BottomWidget(
                          text: 'More Products',
                          buttonText: 'More',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (builder) => const PharmacyProductsPage()),
                            );
                          },
                        ),
                      ],
                    ),
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
