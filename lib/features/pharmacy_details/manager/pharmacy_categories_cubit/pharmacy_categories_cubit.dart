import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_model.dart';

part 'pharmacy_categories_state.dart';

class PharmacyCategoriesCubit extends Cubit<PharmacyCategporiesState> {
  PharmacyCategoriesCubit() : super(PharmacyCategporiesInitial());
  static PharmacyCategoriesCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  List<ProductsModel> categories = [
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
    ProductsModel(
      'product6',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product7',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product8',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product9',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product10',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
    ProductsModel(
      'product11',
      'assets/test/product_image.jpeg',
      'panadol',
      '99',
      'A pain Killer Medicine ',
    ),
  ];
}
