class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNo;
  String? image;

  UserModel(this.id, this.name, this.email, this.phoneNo, this.image);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNo': phoneNo,
        'image': image,
      };

  UserModel.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    image = json['image'];
  }
}
