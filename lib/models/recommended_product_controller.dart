import 'dart:convert';
import 'package:betting_app/models/products.dart';
import 'package:betting_app/models/recommended_product_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  var _recommendedproductlist = [];
  List<dynamic> get recommendedproductlist => _recommendedproductlist;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      //print("Got it baby");
      _recommendedproductlist = [];
      _recommendedproductlist.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      //print("Nhi load ho rha hai bc");
    }
  }
}
