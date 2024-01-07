class OffersModel {
  String? banner;

  OffersModel.fromJson(Map<String, dynamic>? json) {
    banner = json!['banner'];
  }
}
