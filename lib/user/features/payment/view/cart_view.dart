import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/payment/manager/cart_cubit/cart_cubit.dart';
import 'package:intelligent_pharmacy/user/features/payment/view/payment_page.dart';
import 'package:intelligent_pharmacy/user/features/payment/view/widgets/cart_item_widget.dart';

import '../../pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartItems(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          final CartCubit cubit = CartCubit.get(context);
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
                    child: state is GetAllCartProductsLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) => AspectRatio(
                              aspectRatio: 1 / .5,
                              child: CartItem(
                                  cartItem: cubit.cartProducts[index],
                                  onTap: () {
                                    cubit.removeItemFromCart(cubit.cartProducts[index]);
                                  }),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: cubit.cartProducts.length,
                          ),
                  ),
                  BottomWidget(
                    text: 'Total: ${cubit.price}\$',
                    buttonText: 'CheckOut',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => PaymentPage(totalAmount: cubit.price)),
                      );
                    },
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
