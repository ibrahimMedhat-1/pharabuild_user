import 'package:flutter/material.dart';

import '../../../pharmacy_details/view/pharmacy_details.dart';

class PharmacyWidget extends StatelessWidget {
  const PharmacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => PharmacyDetails(
                        image: 'assets/test/pharmacy_img.jpeg',
                        tag: '$index',
                        pharmacyName: 'Pharmacy Name',
                      )),
            );
          },
          child: Hero(
            tag: index.toString(),
            child: AspectRatio(
              aspectRatio: 1 / 1.1,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/test/pharmacy_img.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            'pharmacy Name',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
                          ),
                          Text(
                            'pharmacy phone',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                          ),
                          Text(
                            'pharmacy Address',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 5,
      ),
    );
  }
}
