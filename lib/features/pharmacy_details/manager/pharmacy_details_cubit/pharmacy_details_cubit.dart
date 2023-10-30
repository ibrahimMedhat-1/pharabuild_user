import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'pharmacy_details_state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit() : super(PharmacyDetailsInitial());
  static PharmacyDetailsCubit get(context) => BlocProvider.of(context);
  String buttonName = 'Add To Cart';
  bool isInCart = false;
  void callPharmacy(String phoneNo) async {
    await launchUrl(Uri.parse('tel://$phoneNo'));
  }

  void addToCart() {
    buttonName = 'Remove From Cart';
    isInCart = true;
    emit(AddProductToCart());
    showToast('Product is added');
  }

  void removeFromCart() {
    buttonName = 'Add To Cart';
    isInCart = false;
    emit(RemoveProductFromCart());
    showToast('Product is removed');
  }
}
