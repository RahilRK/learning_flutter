import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/cubit_form_validation_api_eg/login/model/LoginRequestModel.dart';
import 'package:meta/meta.dart';

import '../model/LoginResponseModel.dart';
import '../repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitialState());

  TextEditingController emailController = TextEditingController(text: 'eve.holt@reqres.in');
  TextEditingController passwordController = TextEditingController(text: 'cityslicka');

  final formKey = GlobalKey<FormState>();

  void doLogin() async {
    try {
      if(!formKey.currentState!.validate()) {
        return;
      }

      emit(LoginLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));
      var response = await loginRepository.doLogin(LoginRequestModel(
          email: emailController.text, password: passwordController.text));
      if (response.statusCode == 200) {
        emit(LoginSuccessState(LoginResponseModel.fromJson(response.data)));
      } else {
        emit(LoginErrorState("LoginCubit: Something went wrong in doLogin"));
      }
    } catch (e, stacktrace) {
      var error = e.toString();
      emit(LoginErrorState(error));
    }
  }
}
