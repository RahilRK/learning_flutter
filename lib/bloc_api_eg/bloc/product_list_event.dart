part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {

}

final class LoadProductListEvent extends ProductListEvent {
  final RequestMealModel requestMealModel;
  LoadProductListEvent(this.requestMealModel);
}