class DoctorModel {
  String? id;
  String? name;
  String? phoneNo;
  String? speciality;
  String? lastMessage;
   List<dynamic>? images;
   String? description;


  DoctorModel(
      {this.id,
      this.name,
      this.phoneNo,
        this.images,
        this.description,

      this.speciality,
      this.lastMessage});

  DoctorModel.fromJson(Map<String, dynamic>? json, {this.lastMessage}) {
    id = json!['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    images = List<String>.from(json['images'] ?? []);
    description = json['description'];
    speciality = json['speciality'];

  }

}

