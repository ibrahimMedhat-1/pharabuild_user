import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/pharmacy_categories.dart';

class CategoryItem extends StatelessWidget {
  final String icon;

  const CategoryItem({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const PharmacyCategoriesPage(),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.all(10),
        child: ImageIcon(
          AssetImage(icon),
        ),
      ),
    );
  }
}
