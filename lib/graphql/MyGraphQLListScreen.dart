import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/graphql/country_cubit.dart';
import 'package:learning_flutter/graphql/country_page.dart';
import 'package:learning_flutter/graphql/country_repository.dart';

class MyGraphqlListScreen extends StatelessWidget {
  final CountryRepository repo;

  const MyGraphqlListScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountryCubit(repo)..fetchCountries(), // auto-load on start
      child: MaterialApp(
        title: 'GraphQL + Cubit Demo',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        home: const CountryPage(),
      ),
    );
  }
}
