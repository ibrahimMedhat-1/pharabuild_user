import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';
import 'package:meta/meta.dart';

import '../../../../../models/doctor_model.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit() : super(DoctorListInitial());

  static DoctorListCubit get(context) => BlocProvider.of(context);
  String? dropDownMenuItemValue;
  List<DoctorModel> doctorsList = [];

  void changeDropDownItem(value) {
    doctorsList.clear();
    dropDownMenuItemValue = value;
    emit(ChangeDropDownMenuItemValue());
    emit(GetDoctorBySpecialityLoading());
    if (value != 'All') {
      FirebaseFirestore.instance.collection('doctors').where('speciality', isEqualTo: value).get().then((value) {
        value.docs.forEach((element) {
          doctorsList.add(DoctorModel.fromJson(element.data()));
        });
        emit(GetDoctorBySpecialitySuccessfully());
      }).catchError((onError) {
        emit(GetDoctorBySpecialityError());
        showToast(onError.message);
      });
    } else {
      FirebaseFirestore.instance.collection('doctors').get().then((value) {
        value.docs.forEach((element) {
          doctorsList.add(DoctorModel.fromJson(element.data()));
        });
        emit(GetDoctorBySpecialitySuccessfully());
      }).catchError((onError) {
        emit(GetDoctorBySpecialityError());
        showToast(onError.message);
      });
    }
  }

  void getAllDoctors() {
    emit(GetAllDoctorsLoading());
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      for (var element in value.docs) {
        doctorsList.add(DoctorModel.fromJson(element.data()));
      }
      emit(GetAllDoctorsSuccessfully());
    }).catchError((onError) {
      emit(GetAllDoctorsError());
      showToast(onError.message);
    });
  }
}
