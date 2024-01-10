import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/chatbot/view/chatbot_view.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/doctors_list_view.dart';
import 'package:intelligent_pharmacy/user/features/medicine/view/medicine_page.dart';

import '../../features/home_page/view/home_page.dart';
import '../../features/payment/view/cart_view.dart';
import '../../features/profile/view/profile_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<Widget> pages = const [
    PharmaciesPage(),
    MedicinePage(),
    CartPage(),
    ChatBotPage(),
    DoctorsListView(),
    ProfilePage(),
  ];
  int page = 0;
  void changePage(index) {
    page = index;
    emit(ChangePageInLayout());
  }
}
