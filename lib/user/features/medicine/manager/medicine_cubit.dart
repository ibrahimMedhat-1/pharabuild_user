import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/offers_model.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../models/product_model.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  static MedicineCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  List<ProductsModel> products = [];
  List<OffersModel> offers = [];
  List<ProductsModel> searchMedicineProducts = [];
  List<ProductsModel> similarProducts = [];
  String dropDownMenuItemValue = 'Medicine';

  void getProducts() {
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('Product').get().then((value) {
          value.docs.forEach((element) {
            element.reference.get().then((value) {
              products.add(ProductsModel.fromJson(value.data()));
              emit(GetAllMedicineProductsSuccessfully());
            });
          });
        });
      });
    });
  }

  void getAllOffers() {
    emit(GetAllOffersLoading());
    FirebaseFirestore.instance.collection('allOffers').get().then((value) async {
      for (var element in value.docs) {
        var offer = await element.data()['reference'].get();
        offers.add(OffersModel.fromJson(offer.data()));
      }
      emit(GetAllOffersSuccessfully());
    }).catchError((onError) {
      emit(GetAllOffersError());
      showToast(onError.message);
    });
  }

  void searchMedicine(String value) {
    for (ProductsModel product in products) {
      if (product.name!.toLowerCase().contains(value.toLowerCase())) {
        searchMedicineProducts.add(product);
      }
    }
    emit(IsSearchingInMedicineInCategory());
  }

  void isSearching(bool isSearching) {
    if (isSearching) {
      emit(IsSearchingInMedicineInCategory());
    } else {
      searchMedicineProducts = [];
      emit(IsNotSearchingInMedicineInCategory());
    }
  }

  void changeDropDownItem(value) {
    dropDownMenuItemValue = value;
    emit(ChangeDropDownMenuItemValue());
  }
}
