import 'package:learning_flutter/bloc_api_eg/data/model/requestMealModel.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import '../model/responseMealModel.dart';
import '../provider/product_list_provider.dart';

abstract class IProductListRepository {

  Future<ResponseMealModel> getProductList(RequestMealModel requestMealModel);
}

class ProductListRepository implements IProductListRepository {

  final ProductListProvider productListProvider;

  ProductListRepository(this.productListProvider);

  @override
  Future<ResponseMealModel> getProductList(RequestMealModel requestMealModel) {

    return productListProvider.getProductList(requestMealModel);
  }

}