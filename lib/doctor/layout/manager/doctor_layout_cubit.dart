import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/home_page/view/home_page.dart';
import 'package:intelligent_pharmacy/doctor/features/settings/view/settings_page.dart';

part 'doctor_layout_state.dart';

class DoctorLayoutCubit extends Cubit<DoctorLayoutState> {
  DoctorLayoutCubit() : super(DoctorLayoutInitial());
  static DoctorLayoutCubit get(context) => BlocProvider.of(context);
  int page = 0;
  List<Widget> pages = const [
    DoctorHomePage(),
    DoctorSettingsPage(),
  ];

  void changePage(page) {
    this.page = page;
    emit(ChangeDoctorLayoutPage());
  }
}
