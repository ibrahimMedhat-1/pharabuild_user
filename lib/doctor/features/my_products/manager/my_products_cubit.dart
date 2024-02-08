import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/product_model.dart';
import '../../../../shared/utils/constants.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(MyProductsInitial());
  static MyProductsCubit get(context) => BlocProvider.of(context);
  List<ProductsModel> products = [];
  void getProducts() async {
     await FirebaseFirestore.instance.collection('doctors')
        .doc(Constants.doctorModel!.id)
        .collection('Product')
        .get().then((value) {
      for (var element in value.docs) {
        element.reference.get().then((value){
          products.add(ProductsModel.fromJson(value.data()));
          emit(GetProducts());

        });
      }
    });



}
}
