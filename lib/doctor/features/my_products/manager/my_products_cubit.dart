import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/add_products/manager/add_product__cubit.dart';
import '../../../../models/product_model.dart';
import '../../../../shared/utils/constants.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(MyProductsInitial());
  static MyProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController updatePriceController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  String? name;

  void onChangeName(String? value) {
    name = value;
  }
  String? price;
  void onChangePrice(String? value){
    price=value;
  }
  void updateProducts(String docId){
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(Constants.doctorModel!.id)
        .collection('Product')
        .doc(docId)
        .update({
      'price':price?? productsModel?.price,
      'name':name?? productsModel?.name
    });
    getProducts();
    emit(UpdateProduct());

  }

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
