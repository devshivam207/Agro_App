import 'package:betting_app/models/apiclient.dart';
import 'package:betting_app/models/appconstant.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

/*
    -> Repo har part ke liye alag hogi
    -> Repo hmesa apiclient ko legi as constructor
    -> ek function hai jisko call krne par wo apiclient ma pass kiye gye url ka output  response return krega
    -> isme hmko base url ke aageka url daalna hai only
    -> ye call hoga controller se
 */ 

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstant.popularproducturl);
  }
}
