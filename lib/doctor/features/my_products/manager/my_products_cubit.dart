import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void updateProducts(String docId, nameInitialValue, priceInitialValue,BuildContext context) async{
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(Constants.doctorModel!.id)
        .collection('Product')
        .doc(docId)
        .update({'price': price ?? priceInitialValue, 'name': name ?? nameInitialValue});
   await getProducts();
    emit(UpdateProduct());
    Navigator.pop(context);

  }


  List<ProductsModel> products = [];
  Future<void> getProducts() async {
     await FirebaseFirestore.instance.collection('doctors')
        .doc(Constants.doctorModel!.id)
        .collection('Product')
        .get().then((value) {
       products.clear();
      for (var element in value.docs) {
        element.reference.get().then((value){
          products.add(ProductsModel.fromJson(value.data()));
          emit(GetProducts());

        });
      }
    });



}


}
