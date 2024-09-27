import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/cubit_dynamic_list_eg/model/person.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final List<Person> personList = [];

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  int editIndex = 0;

  PersonCubit() : super(PersonInitialState(disableAddBtn: false));

  void addPerson(Person model) {
    personList.add(model);
    emit(PersonUpdateState(disableAddBtn: false, person: personList));
    nameTextEditingController.clear();
    addressTextEditingController.clear();
  }

  void removePerson(int index) {
    personList.removeAt(index);
    if (personList.isEmpty) {
      emit(PersonInitialState(disableAddBtn: false));
    } else {
      emit(PersonUpdateState(disableAddBtn: false, person: personList));
    }
  }

  void onEditIconClick(int index, Person model) {
    editIndex = index;
    nameTextEditingController.text = model.name;
    addressTextEditingController.text = model.address;
    emit(PersonUpdateState(disableAddBtn: true, person: personList));
  }

  void onEditClick(int index, Person model) {
    personList[index] = model;
    emit(PersonUpdateState(disableAddBtn: false, person: personList));
    nameTextEditingController.clear();
    addressTextEditingController.clear();
  }

  void dispose() {
    nameTextEditingController.dispose();
    addressTextEditingController.dispose();
  }
}
