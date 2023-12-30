import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/product_model.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());
  static MedicineCubit get(context) => BlocProvider.of(context);
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
    ProductsModel(
      'product12',
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
