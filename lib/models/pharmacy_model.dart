import 'package:intelligent_pharmacy/models/review_model.dart';

class PharmacyModel {
  final String pharmacyName;
  final String pharmacyNo;
  final String pharmacyAddress;
  final List<ReviewModel> reviews;
  PharmacyModel({
    required this.pharmacyName,
    required this.pharmacyNo,
    required this.pharmacyAddress,
    required this.reviews,
  });
}
