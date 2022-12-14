class ProductModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  num? price;
  double? discountPercentage;
  num? rating;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  int quantity = 1;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }
}
