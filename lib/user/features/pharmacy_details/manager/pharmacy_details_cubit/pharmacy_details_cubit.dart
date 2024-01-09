import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/utils/constants.dart';

part 'pharmacy_details_state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit() : super(PharmacyDetailsInitial());

  static PharmacyDetailsCubit get(context) => BlocProvider.of(context);
  List<ProductsModel> cartProducts = [];
  String buttonName = 'Add To Cart';
  bool isInCart = false;

  void callPharmacy(String phoneNo) async {
    await launchUrl(Uri.parse('tel://$phoneNo'));
  }

  void getCartItems() async {
    emit(GetAllCartProductsLoading());
    await FirebaseFirestore.instance.collection('users').doc(Constants.userId).collection('cart').get().then((value) {
      for (var element in value.docs) {
        cartProducts.add(ProductsModel.fromJson(element.data()));
      }
      emit(GetAllCartProductsSuccessfully());
    }).catchError((onError) {
      emit(GetAllCartProductsError());
      showToast(onError.message);
    });
  }

  void addToCart(ProductsModel productsModel) async {
    DocumentReference reference = FirebaseFirestore.instance
        .collection('pharmacies')
        .doc(productsModel.pharmacyId)
        .collection('products')
        .doc(productsModel.tag);
    emit(AddProductToCartLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userId)
        .collection('cart')
        .doc(productsModel.tag)
        .set({
      'reference': [reference]
    }).then((value) {
      buttonName = 'Remove From Cart';
      isInCart = true;
      emit(AddProductToCartSuccessfully());
      showToast('Product is added');
    }).catchError((onError) {
      emit(AddProductToCartError());
      showToast(onError.message);
    });
  }

  void removeFromCart(ProductsModel productsModel) async {
    emit(RemoveProductFromCartLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userId)
        .collection('cart')
        .doc(productsModel.tag)
        .delete()
        .then((value) {
      buttonName = 'Add To Cart';
      isInCart = false;
      emit(RemoveProductFromCartSuccessfully());
      showToast('Product is removed');
    }).catchError((onError) {
      emit(RemoveProductFromCartError());
      showToast(onError.message);
    });
  }
}
