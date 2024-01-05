// class Product {
//   String? id;
//   String? title;
//   double? price;
//   String? description;
//   String? image;
//   String? category;

//   Product({this.title, this.price, this.description, this.image, this.category});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = double.parse(json['price']);
//     description = json['description'];
//     image = json['image'];
//     category = json['category'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = title;
//     data['price'] = price.toString();
//     data['description'] = description;
//     data['image'] = image;
//     data['category'] = category;
//     return data;
//   }
// }

class Product {
  final String? id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  Product({this.id, required this.title, required this.price, required this.description, required this.image, required this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? "", 
      title: json["title"], 
      price: double.parse(json["price"]), 
      description: json["description"], 
      image: json["image"], 
      category: json["category"]
    );
  }

  Product copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
    String? image,
    String? category
  }) {
    return Product(
      id: id ?? this.id, 
      title: title ?? this.title, 
      price: price ?? this.price, 
      description: description ?? this.description, 
      image: image ?? this.image, 
      category: category ?? this.category
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price.toString();
    data['description'] = description;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}