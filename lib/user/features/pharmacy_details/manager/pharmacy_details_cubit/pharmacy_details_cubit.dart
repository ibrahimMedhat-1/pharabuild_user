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
  String buttonName = 'Add To Cart';
  bool isInCart = false;

  void callPharmacy(String phoneNo) async {
    await launchUrl(Uri.parse('tel://$phoneNo'));
  }

  void isProductInCart(String id) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        if (element.id == id) {
          buttonName = 'Remove From Cart';
          isInCart = true;
          emit(ProductIsInCart());
        }
      }
    });
  }

  void addToCart(ProductsModel productsModel) async {
    DocumentReference reference = FirebaseFirestore.instance
        .collection('pharmacies')
        .doc(productsModel.pharmacyId!.trim())
        .collection('products')
        .doc(productsModel.tag!.trim());
    emit(AddProductToCartLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('cart')
        .doc(productsModel.tag)
        .set({'reference': reference}).then((value) {
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
        .doc(Constants.userModel!.id)
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
  List<String> imageList = [
    'assets/33.jpg',
    'assets/d02853fe5b5c492f3c2f6114491d035b (1).jpg',
    'assets/13.jpg',

  ];
  List<ProductModel> productList = [
    ProductModel(name: 'product name', price: '10 LE', imageUrl: 'assets/31072.jpeg'),
    ProductModel(name: 'product name', price: '15 LE', imageUrl: 'assets/This-or-That-Ceramic-vs-Porcelain-_-Cover-7-8-23-ar-1102023-420x230.jpg'),
    ProductModel(name: 'product name', price: '12 LE', imageUrl: 'assets/Cement_02_(cropped).jpg'),
  ];
}
class ProductModel {
  final String name;
  final String price;
  final String imageUrl;

  ProductModel({required this.name, required this.price, required this.imageUrl});
}
