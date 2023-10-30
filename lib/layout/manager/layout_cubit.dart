import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/features/payment/view/cart_view.dart';

import '../../features/home_page/view/home_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<Widget> pages = const [
    HomePage(),
    CartPage(),
  ];
  int page = 0;
  void changePage(index) {
    page = index;
    emit(ChangePageInLayout());
  }
}
