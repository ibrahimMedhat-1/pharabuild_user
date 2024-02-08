class ProductsModel {
  String? tag;
  String? image;
  String? name;
  String? price;


  ProductsModel(
    this.tag,
    this.image,
    this.name,
    this.price,

  );

  ProductsModel.fromJson(Map<String, dynamic>? json) {
    tag = json!['id'];
    image = json['image'];
    name = json['name'];
    price = json['price'];

  }

  Map<String, dynamic> toMap() => {
        'id': tag,
        'image': image,
        'price': price,
        'name': name,
      };
}
class PortfolioModel {

  List<String>? listImagesUrl;


  PortfolioModel(

      this.listImagesUrl,

      );
  PortfolioModel.fromJson(Map<String, dynamic>? json) {

    listImagesUrl = json!['listImagesUrl'];

  }

}
