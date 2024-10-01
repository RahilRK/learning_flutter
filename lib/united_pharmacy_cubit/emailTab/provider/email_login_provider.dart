
import 'package:dio/dio.dart';


import '../../../united_pharmacy_cubit/model/request/LoginRequest.dart';
import '../../../united_pharmacy_cubit/model/response/LoginResponse.dart';

// var baseUrl = 'https://unitedpharmacy.sa/en';
var baseUrl = 'https://staging.unitedpharmacy.sa/en';

/*todo this class is used to make API call*/
class UnitedPharaEmailLoginProvider {
  var logInUrl = '/mobikulhttp/customer/logIn';
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  var loginRes= LoginResponse();

  Future<LoginResponse> logIn(LoginRequest requestModel) async {
    var loginRes= LoginResponse();
    Map<String, dynamic> params = requestModel.toJson();
    FormData formData = FormData.fromMap(params);
    try {
      print('logIn params: $params');
      final response = await dio.post(logInUrl, data: formData);
      print('logIn response: ${response.data}');
      loginRes = LoginResponse.fromJson(response.data);
      return loginRes;
    } on DioException catch (e, stacktrace) {

      // handle 400 status code error
      if (e.response != null) {
        print(e.response?.statusCode);
        print(e.response?.data);
        print(e.response?.realUri);
        // print(e.response?.headers);
        // print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // print(e.requestOptions);
        // print(e.message);
      }
      var errorRes = e;
      print(errorRes);
      print(stacktrace);
      return throw Exception(errorRes.error);
    }
  }
}
