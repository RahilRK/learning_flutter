import 'package:dio/dio.dart';
import 'package:learning_flutter/bloc_api_eg/data/model/requestMealModel.dart';

import '../model/responseMealModel.dart';


/*todo this class is used to make API call*/
class ProductListProvider {
  final dio = Dio(BaseOptions(baseUrl: "https://themealdb.com/"));

  Future<ResponseMealModel> getProductList(RequestMealModel requestMealModel) async {
    Map<String, dynamic> queryParams = requestMealModel.toJson();
    try {
      final response = await dio.get('api/json/v1/1/filter.php', queryParameters: queryParams);
      print('response here: ${response.data.toString()}');

      return ResponseMealModel.fromJson(response.data);
    } catch (e, stacktrace) {
      print('Exception: ' + e.toString());
      print('Stacktrace: ' + stacktrace.toString());
      return Future.error(e.toString());
    }
  }
}
