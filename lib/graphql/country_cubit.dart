import 'package:bloc/bloc.dart';
import 'package:learning_flutter/graphql/country.dart';
import 'package:learning_flutter/graphql/country_repository.dart';
import 'package:meta/meta.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepository _repo;

  CountryCubit(this._repo) : super(CountryInitial());

  Future<void> fetchCountries() async {
    emit(CountryLoading());
    try {
      final items = await _repo.getCountries();
      emit(CountryLoaded(items));
    } catch (e) {
      emit(CountryError(e.toString()));
    }
  }
}
