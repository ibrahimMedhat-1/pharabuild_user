import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_pharmacy/models/doctor_model.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../shared/utils/constants.dart';

part 'add_product__state.dart';

DoctorModel? doctorModel ;
ProductsModel? productsModel;
class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  static AddProductCubit get(context) => BlocProvider.of(context);

  TextEditingController productNameCntroller=TextEditingController();
  TextEditingController productPriceCntroller=TextEditingController();
  File? image;
  final picker = ImagePicker();
  ProductsModel? product;

  void addProduct({required String image,   String? tag,  required String name, required String price}) {
    product = ProductsModel(tag, image, name, price);
    emit(AddProductLoading());

    var collectionRef = FirebaseFirestore.instance.collection('doctors').doc(Constants.doctorModel!.id).collection('Product');
    collectionRef.add(product!.toMap()).then((DocumentReference docRef) {
      product!.tag = docRef.id;
      docRef.update(product!.toMap());
      FirebaseFirestore.instance.collection("all products")
      .doc(docRef.id).set({
        "reference" : docRef
      }).then((value) {
        productNameCntroller.clear();
        productPriceCntroller.clear();
        imageUrl = null;
        emit(AddProductSuccessfully());
        showToast("Uploaded Successfully");
      });

    });
  }
  String? imageUrl;
  imgFromGallery() async {
    emit(ProductImageLoading());
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
      FirebaseStorage.instance.ref().child('Merchant/${Constants.doctorModel!.id}Products/${DateTime.now()}').putFile(File(value!.path)).then((value) {
        value.ref.getDownloadURL().then((value) {
          imageUrl = value;
          emit(UploadPhoto());
        });
      });
    });
  }


}
