import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/pharmacy_model.dart';

import '../manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';

class PharmacyDetails extends StatefulWidget {
  final PharmacyModel pharmacyModel;

  const PharmacyDetails({
    super.key,
    required this.pharmacyModel,
  });

  @override
  State<PharmacyDetails> createState() => _PharmacyDetailsState();
}

class _PharmacyDetailsState extends State<PharmacyDetails> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyDetailsCubit(),
      child: BlocConsumer<PharmacyDetailsCubit, PharmacyDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyDetailsCubit cubit = PharmacyDetailsCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                        child:
                        Column(
                          children: [
                            CarouselSlider(
                              items: cubit.imageList.map((imageUrl) {
                                return Image.asset(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 200.0,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: cubit.imageList.map((imageUrl) {
                                int index = cubit.imageList.indexOf(imageUrl);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        )
                    // TopImageWidget(tag: pharmacyModel.id!, image: pharmacyModel.image!)
                    ),
                    Text(
                      "Contractor Name",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.callPharmacy(widget.pharmacyModel.phoneNo!);
                      },
                      child: Text(
                        widget.pharmacyModel.phoneNo!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    // Text(
                    //   'Categories',
                    //   style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: widget.pharmacyModel.categories!
                    //         .map((e) => CategoryItem(
                    //               categoryModel: e,
                    //               productsModel: widget.pharmacyModel.products!,
                    //               offers: widget.pharmacyModel.offers!,
                    //             ))
                    //         .toList(),
                    //   ),
                    // ),
                    const SizedBox(height: 25,),
                    Text(
                      'Products',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: GridView.builder(
                        itemCount: cubit.productList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          ProductModel item = cubit.productList[index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    item.imageUrl,
                                    width: double.infinity,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        item.price,
                                        style: const TextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // BottomWidget(
                    //   text: 'More Products',
                    //   buttonText: 'More',
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (builder) => PharmacyProductsPage(widget.pharmacyModel)),
                    //     );
                    //   },
                    // ),
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
