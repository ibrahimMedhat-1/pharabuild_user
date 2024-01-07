import 'package:intelligent_pharmacy/models/category_model.dart';
import 'package:intelligent_pharmacy/models/offers_model.dart';
import 'package:intelligent_pharmacy/models/product_model.dart';
import 'package:intelligent_pharmacy/models/review_model.dart';

class PharmacyModel {
  String? name;
  String? image;
  String? id;
  String? phoneNo;
  String? address;
  List<CategoryModel>? categories;
  List<ReviewModel>? reviews;
  List<ProductsModel>? products;
  List<OffersModel>? offers;

  PharmacyModel.fromJson({
    Map<String, dynamic>? json,
    this.reviews,
    this.products,
    this.categories,
    this.offers,
  }) {
    name = json!['name'];
    phoneNo = json['phoneNo'];
    address = json['address'];
    image = json['image'];
    id = json['id'];
  }
}
