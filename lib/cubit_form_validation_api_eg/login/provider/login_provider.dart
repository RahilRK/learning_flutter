import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/LoginRequestModel.dart';
import '../model/LoginResponseModel.dart';

/*todo this class is used to make API call*/
class LoginProvider {
  final dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api/"));

  Future<Response> doLogin(LoginRequestModel requestModel) async {
    Map<String, dynamic> params = requestModel.toJson();
    try {
      print('doLogin params: $params');
      final response = await dio.post('login', data: params);
      print('doLogin response statusCode: ${response.statusCode.toString()}');
      print('doLogin response: ${response.data.toString()}');
      /*if(response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.errorRes);
      }
      else {
        return LoginResponseModel.fromJson(response.errorRes);
      }*/
      return response;
    } on DioException catch (e) {

      // handle 400 status code error
      if (e.response != null) {
        print(e.response?.statusCode);
        print(e.response?.data);
        // print(e.response?.headers);
        // print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // print(e.requestOptions);
        // print(e.message);
      }
      var errorRes = LoginResponseModel.fromJson(e.response?.data);
      return throw Exception(errorRes.error);
    }
  }
}
