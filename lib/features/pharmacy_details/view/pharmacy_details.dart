import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/manager/pharmacy_details_cubit.dart';

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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        Hero(
                          tag: tag,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            child: Image.asset(
                              image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).width * 0.05,
                            left: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade600,
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pharmacyName,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  height: 2,
                                ),
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
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                              )
                            ],
                          )
                        ],
                      ),
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
