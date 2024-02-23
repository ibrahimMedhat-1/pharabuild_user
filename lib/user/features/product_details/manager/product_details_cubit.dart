import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/product_model.dart';
import '../../../../shared/toast.dart';
import '../../../../shared/utils/constants.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  void addToCart(ProductsModel productsModel)async{
    DocumentReference reference = FirebaseFirestore.instance
        .collection('all products')
        .doc(productsModel.tag!.trim());
    emit(AddProductToCartLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .doc(productsModel.tag)
        .set({'reference': reference}).then((value) {
      emit(ProductAddedToCart());
      showToast('Product is added');
    });



  }
}
