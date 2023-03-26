import 'package:betting_app/models/products.dart';

class CartModel {
  int? pid;
  int? id;
  String? name;
  int? price;
  String? company;
  String? img;
  int? quantity;
  bool? isExist;
  ProductModel? product;

  CartModel(
      {this.pid,
      this.id,
      this.name,
      this.price,
      this.company,
      this.img,
      this.quantity,
      this.isExist,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    name = json['name'];
    price = json['price'];
    company = json['company'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pid'] = this.pid;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['company'] = this.company;
    return data;
  }
}
