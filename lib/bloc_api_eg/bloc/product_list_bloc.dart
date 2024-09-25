import 'package:bloc/bloc.dart';
import 'package:learning_flutter/bloc_api_eg/bloc/product_list_state.dart';
import 'package:learning_flutter/bloc_api_eg/data/repository/product_list_repository.dart';
import 'package:meta/meta.dart';


part 'product_list_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository productListRepository;

  ProductListBloc(this.productListRepository)
      : super(ProductListInitialState()) {
    on<ProductListEvent>((event, emit) async {
      emit(ProductListLoadingState());
      try {
        final productList = await productListRepository.getProductList();
        emit(ProductListSuccessState(productList));
      } catch (e) {
        var error = e.toString();
        emit(ProductListErrorState(error));
      }
    });
  }
}
