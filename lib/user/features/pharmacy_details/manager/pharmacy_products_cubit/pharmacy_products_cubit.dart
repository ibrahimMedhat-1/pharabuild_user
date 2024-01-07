import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/product_model.dart';

part 'pharmacy_products_state.dart';

class PharmacyProductsCubit extends Cubit<PharmacyProductsState> {
  PharmacyProductsCubit() : super(PharmacyProductsInitial());

  static PharmacyProductsCubit get(context) => BlocProvider.of(context);
  List<ProductsModel> products = [
    ProductsModel(
      'product0',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product1',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product2',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product3',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product4',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product5',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
  ];
  List<ProductsModel> similarProducts = [];
  String dropDownMenuItemValue = 'Medicine';

  void getSimilarProducts(String effectiveMaterial) {
    FirebaseFirestore.instance.collection('pharmacies').get().then((value) {
      for (var element in value.docs) {
        element.reference
            .collection('products')
            .where('effectiveMaterial', isEqualTo: effectiveMaterial)
            .get()
            .then((value) {
          for (var element in value.docs) {
            similarProducts.add(ProductsModel.fromJson(element.data()));
          }
        });
      }
    });
  }

  void changeDropDownItem(value) {
    dropDownMenuItemValue = value;
    emit(ChangeDropDownMenuItemValue());
  }
}
