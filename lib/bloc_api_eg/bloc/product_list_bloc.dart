import 'package:bloc/bloc.dart';
import 'package:learning_flutter/bloc_api_eg/bloc/product_list_state.dart';
import 'package:learning_flutter/bloc_api_eg/data/model/requestMealModel.dart';
import 'package:learning_flutter/bloc_api_eg/data/repository/product_list_repository.dart';
import 'package:meta/meta.dart';


part 'product_list_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository productListRepository;

  ProductListBloc(this.productListRepository)
      : super(ProductListInitialState()) {
    on<ProductListEvent>((event, emit) async {

      if (event is LoadProductListEvent) {
        print("here's the data : ${event.requestMealModel.toJson()}");
        emit(ProductListLoadingState());
        try {
          final productList = await productListRepository.getProductList(event.requestMealModel);
          emit(ProductListSuccessState(productList));
        } catch (e) {
          var error = e.toString();
          emit(ProductListErrorState(error));
        }
      }
    });
  }
}
