import 'package:betting_app/models/apiclient.dart';
import 'package:betting_app/models/appconstant.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/cart_repo.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/models/popular_product_repo.dart';
import 'package:betting_app/models/recommended_product_controller.dart';
import 'package:betting_app/models/recommended_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appbaseurl: AppConstant.baseurl));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  Get.lazyPut(() => PopularProductsController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
