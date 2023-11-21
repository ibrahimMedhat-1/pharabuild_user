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
  List<ProductsModel> similarProducts = [
    ProductsModel(
      'similarProducts0',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'similarProducts1',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'similarProducts2',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'similarProducts3',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'similarProducts4',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'similarProducts5',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
  ];
  String dropDownMenuItemValue = 'Medicine';

  void changeDropDownItem(value) {
    dropDownMenuItemValue = value;
    emit(ChangeDropDownMenuItemValue());
  }
}
