import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  void removeItemFromCart() {
    showToast('Product is removed');
    emit(RemoveProductFromCart());
  }
}
