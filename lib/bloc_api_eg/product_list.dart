import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc_api_eg/bloc/product_list_bloc.dart';

import 'bloc/product_list_state.dart';
import 'data/model/MealModel.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductListBloc>().add(LoadProductListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bloc Api App'),
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductListErrorState) {
            return Center(
              child: Text("Error occurred: ${state.error}"),
            );
          } else if (state is ProductListSuccessState) {
            List<Meals> productList = state.mealModel.meals ?? [];

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: productList.length, // Number of items in your list
              itemBuilder: (BuildContext context, int index) {
                var model = productList[index];

                return ProductItem(model);
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget ProductItem(Meals model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(model.strMealThumb??"strMealThumb"),
        title: Text(model.strMeal??"strMeal"),
        onTap: () {
          print("onTap");
        },
      ),
    );
  }
}
