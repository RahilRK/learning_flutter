import 'package:dio/dio.dart';

import '../model/MealModel.dart';


/*todo this class is used to make API call*/
class ProductListProvider {
  // final dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/"));
  final dio = Dio(BaseOptions(baseUrl: "https://themealdb.com/",queryParameters: {"a": "Canadian"}));

  Future<MealModel> getProductList() async {
    try {
      final response = await dio.get('api/json/v1/1/filter.php');
      print('response here: ${response.data.toString()}');

      return MealModel.fromJson(response.data);
    } catch (e, stacktrace) {
      print('Exception: ' + e.toString());
      print('Stacktrace: ' + stacktrace.toString());
      return Future.error(e.toString());
    }
  }
}
