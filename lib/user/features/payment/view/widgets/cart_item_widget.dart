import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';

class CartItem extends StatelessWidget {
  final Function() onTap;
  final ProductsModel cartItem;

  const CartItem({
    required this.cartItem,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
          )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CachedNetworkImage(
          height: 100,
          fit: BoxFit.fill,
          imageUrl: cartItem.image!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
        title: Text(
          cartItem.name!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          '\$ ${cartItem.price}',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          child: const Text('Delete'),
          onPressed: () {
            onTap();
          },
        ),

      ),

     
    );
  }
}
