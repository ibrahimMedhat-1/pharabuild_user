import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String tag;
  final String productImage;
  final String productName;
  final String productPrice;
  final String productDescription;
  final Function() onTap;

  const ProductItem({
    super.key,
    required this.tag,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Hero(
        tag: tag,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  productImage,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                productName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '\$$productPrice',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
