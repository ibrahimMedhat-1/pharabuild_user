import 'package:intelligent_pharmacy/models/review_model.dart';

class DoctorModel {
  final String doctorName;
  final String doctorNo;
  final String doctorAddress;
  final List<ReviewModel> reviews;

  DoctorModel(
    this.doctorName,
    this.doctorNo,
    this.doctorAddress,
    this.reviews,
  );
}
