
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/united_pharmacy_cubit/mobileNumberTab/cubit/mobile_no_login_state.dart';
import 'package:learning_flutter/united_pharmacy_cubit/mobileNumberTab/repository/email_login_repository.dart';

import '../../../united_pharmacy_cubit/model/request/LoginRequest.dart';



class UnitedPharaMobNoLoginCubit extends Cubit<UnitedPharaMobNoLoginState> {
  final UnitedPharaMobNoLoginRepository loginRepository;

  UnitedPharaMobNoLoginCubit(this.loginRepository)
      : super(MobNoLoginInitialState(passwordVisible: false));

  TextEditingController mobNoController =
      TextEditingController(text: '');
  TextEditingController passwordController =
      TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  late final List<GlobalKey<FormFieldState>> fieldKeys;
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  void doPasswordToggle(bool mPasswordVisible) {
    emit(MobNoLoginInitialState(passwordVisible: mPasswordVisible));
  }

  void logInWithEmail() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      emit(MobNoLoginLoadingState(passwordVisible: false));
      var response = await loginRepository.logIn(LoginRequest(
          websiteId: "1",
          storeId: "1",
          quoteId: "0",
          mFactor: "2.625",
          currency: "SAR",
          username: mobNoController.text,
          mobile: mobNoController.text,
          password: passwordController.text,
          os: "android"));
      emit(MobNoLoginSuccessState(passwordVisible: false, loginResponseModel: response));
      
    } catch (e, stacktrace) {
      var error = e.toString();
      print(e);
      print(stacktrace);
      emit(MobNoLoginErrorState(passwordVisible: false, error: error));
    }
  }
}
