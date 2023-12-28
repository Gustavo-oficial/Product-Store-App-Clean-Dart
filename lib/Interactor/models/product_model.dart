class Product {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? image;
  String? category;

  Product({this.title, this.price, this.description, this.image, this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toNewProduct() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}