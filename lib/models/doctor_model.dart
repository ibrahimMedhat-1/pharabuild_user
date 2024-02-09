class DoctorModel {
  String? id;
  String? name;
  String? phoneNo;
  String? speciality;
  String? lastMessage;
   List<Portfolio>? portfolio;


  DoctorModel(
      {this.id,
      this.name,
      this.phoneNo,
        this.portfolio,

      this.speciality,
      this.lastMessage});

  DoctorModel.fromJson(Map<String, dynamic>? json, {this.lastMessage}) {
    id = json!['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];

    speciality = json['speciality'];

  }
  DoctorModel.fromCache(Map<String, dynamic>? json, {this.lastMessage}) {
    id = json!['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];

    speciality = json['speciality'];

  }
}
class Portfolio {
  final String description;
  final List<String> images;

  Portfolio({required this.description, required this.images});
}
