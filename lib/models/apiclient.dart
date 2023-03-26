import 'package:betting_app/models/appconstant.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

/*
  -> ApiClient ek hi hota hai poore app ka 
  -> Repo har json ka alag hoga
  -> controller har json ka alag hoga 
  -> controller access krega repo ko aur repo access krega apiclinet ko
  -> repo kewal url ka response return krega apiclient ki madad se required methods ya functions banenge controller ma.
  
  -> ApiClient ma ek token hoga 
  -> App ka baseurl hoga
  -> timeout (agar itne time ma app load nhi hua tho band)
  -> constructor ke through isme base url pass krenge 
  -> mainheader (kaam mujhe bhi nhi pta ) iske bina bhi kaam chl jaayega
  *-> ek function hai getdata jo ki check krega hmko url se data mil rha hai ki nhi
      1> agar data mil rha hai tho usko response type ke variable ma store kra lega of usko return krdega
      2> agar data nhi mila tho catch error and return status code 1 with the error.
      3> Successful data mila the statuscode 200 else 1.
*/

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appbaseurl;
  // ignore: unused_field
  late Map<String, String> _mainHeader;

  ApiClient({required this.appbaseurl}) {
    baseUrl = appbaseurl;
    timeout = const Duration(seconds: 30);
    token = AppConstant.token;
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
