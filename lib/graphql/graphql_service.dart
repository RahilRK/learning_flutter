import 'package:graphql/client.dart';

/// GraphQLService
/// --------------
/// This class sets up the GraphQL client and provides a simple
/// `query()` method that other parts of the app (like the Repository)
/// can use to talk to the API.
///
/// Think of this as the "network helper" that knows how to connect
/// to the GraphQL endpoint.
class GraphQLService {
  // The actual GraphQL client instance (from the graphql package).
  // We mark it `late final` because we create it in the constructor
  // and it never changes afterward.
  late final GraphQLClient client;

  /// Constructor:
  /// - Defines the API endpoint (HttpLink)
  /// - Creates a GraphQLClient with a cache and link
  GraphQLService() {
    // API endpoint (countries GraphQL server)
    final link = HttpLink('https://countries.trevorblades.com/');

    // The GraphQL client needs:
    // - a "link" (how to connect to the server)
    // - a "cache" (to store responses in memory for quick access)
    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(), // simple in-memory cache
    );
  }

  /// Run a GraphQL query.
  ///
  /// Parameters:
  /// - [document]: the query string itself (written in GraphQL language)
  /// - [variables]: optional values to pass into the query
  ///
  /// Returns:
  /// - A [QueryResult] which contains either data or errors.
  Future<QueryResult> query(String document,
      {Map<String, dynamic> variables = const {}}) {
    // Wrap the query string and variables into QueryOptions
    final options = QueryOptions(
      document: gql(document), // gql() parses the string into GraphQL syntax
      variables: variables,
    );

    // Execute the query with the client
    return client.query(options);
  }

  /// Run a GraphQL mutation (write).
  Future<QueryResult> mutate(String document,
      {Map<String, dynamic> variables = const {}}) {
    final options = MutationOptions(
      document: gql(document),
      variables: variables,
    );
    return client.mutate(options);
  }
}
