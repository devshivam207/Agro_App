class Product {
  int? _totalSize;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  product({required totalSize, required products}) {
    _totalSize = totalSize;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  double? star;
  String? img;
  String? location;
  String? company;
  int? pid;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.star,
      this.img,
      this.location,
      this.company,
      this.pid});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    star = json['star'] as double;
    img = json['img'];
    location = json['location'];
    company = json['company'];
    pid = json['pid'];
  }
}
