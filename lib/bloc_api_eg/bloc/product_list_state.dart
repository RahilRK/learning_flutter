
import 'package:flutter/material.dart';
import 'package:learning_flutter/bloc_api_eg/data/model/responseMealModel.dart';

@immutable
sealed class ProductListState {}

final class ProductListInitialState extends ProductListState {}

final class ProductListLoadingState extends ProductListState {}

final class ProductListSuccessState extends ProductListState {
  final ResponseMealModel mealModel;
  ProductListSuccessState(this.mealModel);
}

final class ProductListErrorState extends ProductListState {
  final String error;
  ProductListErrorState(this.error);
}
