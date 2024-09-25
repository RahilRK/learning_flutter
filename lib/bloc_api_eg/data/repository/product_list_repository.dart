import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import '../model/MealModel.dart';
import '../provider/product_list_provider.dart';

abstract class IProductListRepository {

  Future<MealModel> getProductList();
}

class ProductListRepository implements IProductListRepository {

  final ProductListProvider productListProvider;

  ProductListRepository(this.productListProvider);

  @override
  Future<MealModel> getProductList() {

    return productListProvider.getProductList();
  }

}