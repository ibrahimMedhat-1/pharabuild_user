import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/category_model.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';
import 'package:intelligent_pharmacy/models/review_model.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../models/pharmacy_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);
  List<PharmacyModel> pharmacies = [];

  void getAllPharmacies() async {
    if (pharmacies.isEmpty) {
      emit(GetPharmacyLoading());
      await FirebaseFirestore.instance.collection('pharmacies').get().then((value) async {
        for (QueryDocumentSnapshot<Map<String, dynamic>> element in value.docs) {
          List<ReviewModel> reviews = [];
          List<ProductsModel> products = [];
          List<CategoryModel> categories = [];
          for (var category in element.data()['categories']) {
            categories.add(CategoryModel.fromJson(category));
          }
          await element.reference.collection('reviews').get().then((value) {
            for (var element in value.docs) {
              reviews.add(ReviewModel.fromJson(element.data()));
            }
          });
          await element.reference.collection('products').get().then((value) {
            for (var element in value.docs) {
              products.add(ProductsModel.fromJson(element.data()));
            }
          });
          pharmacies.add(PharmacyModel.fromJson(
            json: element.data(),
            reviews: reviews,
            categories: categories,
            products: products,
          ));
          emit(GetPharmacySuccessfully());
        }
      }).catchError((onError) {
        emit(GetPharmacyError());
        showToast(onError.message);
      });
    }
  }
}
