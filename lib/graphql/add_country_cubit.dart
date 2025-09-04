// lib/logic/add_country_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/graphql/country.dart';
import 'package:learning_flutter/graphql/country_repository.dart';

/// States for the mutation flow
abstract class AddCountryState {}

class AddCountryInitial extends AddCountryState {}
class AddCountryLoading extends AddCountryState {}
class AddCountrySuccess extends AddCountryState {
  final Country country;
  AddCountrySuccess(this.country);
}
class AddCountryError extends AddCountryState {
  final String message;
  AddCountryError(this.message);
}

/// Cubit responsible for running the addCountry mutation and emitting states.
class AddCountryCubit extends Cubit<AddCountryState> {
  final CountryRepository _repo;
  AddCountryCubit(this._repo) : super(AddCountryInitial());

  Future<void> addCountry({
    required String code,
    required String name,
    required String emoji,
    String? capital,
  }) async {
    emit(AddCountryLoading());
    try {
      final Country created = await _repo.addCountry(
        code: code,
        name: name,
        emoji: emoji,
        capital: capital,
      );
      emit(AddCountrySuccess(created));
    } catch (e) {
      emit(AddCountryError(e.toString()));
    }
  }
}
