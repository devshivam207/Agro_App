import 'package:betting_app/models/apiclient.dart';
import 'package:betting_app/models/appconstant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstant.recommendedproducturl);
  }
}
