import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/features/pharmacy_details/view/pharmacy_categories.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String categoryName;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => PharmacyCategoriesPage(
                categoryName: categoryName,
                tag: categoryName,
              ),
            ));
      },
      child: Column(
        children: [
          Container(
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
          Hero(
            tag: categoryName,
            child: Text(
              categoryName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
