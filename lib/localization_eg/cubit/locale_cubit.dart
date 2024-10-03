import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(locale: const Locale('en')));

  void changeLanguage(String languageCode) {

    emit(LocaleState(locale: Locale(languageCode)));
  }
}
