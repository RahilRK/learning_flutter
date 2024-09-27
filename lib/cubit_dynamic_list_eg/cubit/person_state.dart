part of 'person_cubit.dart';

sealed class PersonState {
  final bool disableAddBtn;

  const PersonState({required this.disableAddBtn});
}

final class PersonInitialState extends PersonState {
  PersonInitialState({required super.disableAddBtn});
}
final class PersonUpdateState extends PersonState {
  final List<Person> person;
  PersonUpdateState({required super.disableAddBtn, required this.person});
}
