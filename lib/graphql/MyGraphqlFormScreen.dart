import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/graphql/add_country_cubit.dart';
import 'package:learning_flutter/graphql/add_country_page.dart';
import 'package:learning_flutter/graphql/country_repository.dart';

class MyGraphqlFormScreen extends StatelessWidget {
  final CountryRepository repo;
  const MyGraphqlFormScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    // Provide the AddCountryCubit so AddCountryPage can use it.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddCountryCubit(repo)),
        // add other cubits here e.g. CountryCubit(repo) for queries
      ],
      child: MaterialApp(
        title: 'GraphQL Mutation Demo',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        home: const AddCountryPage(),
      ),
    );
  }
}