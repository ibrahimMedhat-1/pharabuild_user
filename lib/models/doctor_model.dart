class DoctorModel {
  String? id;
  String? name;
  String? phoneNo;
  Map<String, dynamic>? address;
  String? speciality;
  String? bio;
  String? image;

  DoctorModel(
    this.id,
    this.name,
    this.phoneNo,
    this.address,
    this.speciality,
    this.bio,
    this.image,
  );

  DoctorModel.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    address = json['address'] as Map<String, dynamic>;
    speciality = json['speciality'];
    bio = json['bio'];
    image = json['image'];
  }
}
