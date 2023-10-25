import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'pharmacy_details_state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit() : super(PharmacyDetailsInitial());
  static PharmacyDetailsCubit get(context) => BlocProvider.of(context);
  void callPharmacy(String phoneNo) async {
    await launchUrl(Uri.parse('tel://$phoneNo'));
  }
}
