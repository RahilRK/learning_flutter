import 'package:graphql/client.dart';
import 'package:learning_flutter/graphql/country.dart';

import 'graphql_service.dart';

/// Repository layer:
/// ----------------
/// This class is responsible for talking to the GraphQL service,
/// running queries, and converting the raw response into Dart objects
/// (`Country` model).
///
/// Why use a Repository?
/// - Keeps GraphQL code separate from UI
/// - Easy to swap/modify API later without touching screens
class CountryRepository {

  // Reference to our GraphQL client service (set up in graphql_service.dart)
  final GraphQLService _gql;

  // Constructor: when we create a repository, we pass the GraphQLService
  CountryRepository(this._gql);

  // The actual GraphQL query string.
  // We ask for: code, name, emoji, and capital of all countries.
  // Note: capital can be null for some countries.
  static const String _countriesQuery = r'''
    query Countries {
      countries {
        code
        name
        emoji
        capital
      }
    }
  ''';

  /// Fetch all countries from the API
  Future<List<Country>> getCountries() async {
    // Run the query using our GraphQL client
    final QueryResult result = await _gql.query(_countriesQuery);

    // If something went wrong (network error, invalid query, etc.),
    // throw an exception so Cubit/Bloc/UI can handle it.
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Extract the "countries" array from the JSON response.
    // If it’s missing, use an empty list instead.
    final List<dynamic> raw = result.data?['countries'] ?? [];

    // Convert each item (Map<String, dynamic>) into a Country object.
    return raw
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ---------- Mutation (fake example) ----------
  // NOTE: The countries API is read-only; replace this mutation with a real one for a writable backend.
  static const String _addCountryMutation = r'''
    mutation AddCountry($code: ID!, $name: String!, $emoji: String!, $capital: String) {
      addCountry(code: $code, name: $name, emoji: $emoji, capital: $capital) {
        code
        name
        emoji
        capital
      }
    }
  ''';

  /// Send the addCountry mutation and return the created Country.
  /// Throws if GraphQL returns an error.
  Future<Country> addCountry({
    required String code,
    required String name,
    required String emoji,
    String? capital,
  }) async {
    final QueryResult result = await _gql.mutate(
      _addCountryMutation,
      variables: {
        'code': code,
        'name': name,
        'emoji': emoji,
        'capital': capital,
      },
    );

    if (result.hasException) {
      // Convert GraphQL exceptions to a simple Dart exception for the Cubit to handle
      throw Exception(result.exception.toString());
    }

    // The mutation returns an object at result.data['addCountry']
    final data = result.data?['addCountry'];
    if (data == null) {
      throw Exception('No data returned from addCountry mutation.');
    }

    return Country.fromJson(data as Map<String, dynamic>);
  }
}
