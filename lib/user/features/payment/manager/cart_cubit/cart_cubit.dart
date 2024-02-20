import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../../models/product_model.dart';
import '../../../../../shared/utils/constants.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<ProductsModel> cartProducts = [];
  int price = 0;
  void getCartItems() async {
    cartProducts.clear();
    price = 0;
    emit(GetAllCartProductsLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        DocumentReference<Map<String, dynamic>> productReference = await element.data()['reference'];
        var product = await productReference.get();
        print(product.data());
        cartProducts.add(ProductsModel.fromJson(product.data()));
        price += int.parse(product.data()!['price']);
      }
      emit(GetAllCartProductsSuccessfully());
    }).catchError((onError) {
      print(onError);
      emit(GetAllCartProductsError());
      // showToast(onError.message.toString());
    });
  }

  void removeItemFromCart(ProductsModel productsModel) async {
    emit(RemoveProductFromCartLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .doc(productsModel.tag)
        .delete()
        .then((value) {
      emit(RemoveProductFromCartSuccessfully());
      showToast('Product is removed');
      getCartItems();
    }).catchError((onError) {
      emit(RemoveProductFromCartError());
      showToast(onError.message);
    });
  }
}
