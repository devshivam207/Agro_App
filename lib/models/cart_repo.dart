import 'package:betting_app/models/product_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addtoCartList(List<CartModel> cartList) {}
}
