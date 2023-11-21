import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/user/features/payment/view/payment_page.dart';
import 'package:intelligent_pharmacy/user/features/payment/view/widgets/cart_item_widget.dart';

import '../../pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const AspectRatio(
                  aspectRatio: 1 / .5,
                  child: CartItem(),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: 3,
              ),
            ),
            BottomWidget(
              text: 'Total: 100\$',
              buttonText: 'CheckOut',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => PaymentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
