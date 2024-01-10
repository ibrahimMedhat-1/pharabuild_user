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
  void getCartItems() async {
    cartProducts.clear();
    print(Constants.userModel!.id);
    emit(GetAllCartProductsLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        var product = await element.data()['reference'].get();
        print(product.data());
        cartProducts.add(ProductsModel.fromJson(product.data()));
      }
      emit(GetAllCartProductsSuccessfully());
    }).catchError((onError) {
      emit(GetAllCartProductsError());
      print(onError);
      showToast(onError.message.toString());
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
