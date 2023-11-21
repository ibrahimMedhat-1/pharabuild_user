import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String image;

  const CarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.grey,
            )
          ],
        ),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ));
  }
}
