import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/graphql/country.dart';
import 'package:learning_flutter/graphql/country_cubit.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries (GraphQL + Cubit)')),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          print("state: ${state.toString()}");
          if (state is CountryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountryError) {
            print("Error: ${state.message}");
            return Center(
              child: Text(
                'Oops: ${state.message}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (state is CountryLoaded) {
            final List<Country> countries = state.countries;
            return ListView.separated(
              itemCount: countries.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final model = countries[index];
                return ListTile(
                  leading: Text(model.emoji, style: const TextStyle(fontSize: 24)),
                  title: Text(model.name),
                  trailing: Text(model.capital),
                  subtitle: Text(model.code),
                );
              },
            );
          }
          // Initial state
          return Center(
            child: FilledButton(
              onPressed: () => context.read<CountryCubit>().fetchCountries(),
              child: const Text('Load Countries'),
            ),
          );
        },
      ),
    );
  }
}
