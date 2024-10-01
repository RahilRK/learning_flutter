
import  'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../united_pharmacy_cubit/model/request/LoginRequest.dart';
import '../../../united_pharmacy_cubit/model/response/LoginResponse.dart';
import '../repository/email_login_repository.dart';


part 'email_login_state.dart';

class UnitedPharaEmailLoginCubit extends Cubit<UnitedPharaEmailLoginState> {
  final UnitedPharaEmailLoginRepository loginRepository;

  UnitedPharaEmailLoginCubit(this.loginRepository)
      : super(EmailLoginInitialState(passwordVisible: false));

  TextEditingController emailController =
      TextEditingController(text: '');
  TextEditingController passwordController =
      TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  late final List<GlobalKey<FormFieldState>> fieldKeys;
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  void doPasswordToggle(bool mPasswordVisible) {
    emit(EmailLoginInitialState(passwordVisible: mPasswordVisible));
  }

  void logInWithEmail() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      emit(EmailLoginLoadingState(passwordVisible: false));
      var response = await loginRepository.logIn(LoginRequest(
          websiteId: "1",
          storeId: "1",
          quoteId: "0",
          mFactor: "2.625",
          currency: "SAR",
          username: emailController.text,
          mobile: emailController.text,
          password: passwordController.text,
          os: "android"));
      emit(EmailLoginSuccessState(passwordVisible: false, loginResponseModel: response));
      
    } catch (e, stacktrace) {
      var error = e.toString();
      print(e);
      print(stacktrace);
      emit(EmailLoginErrorState(passwordVisible: false, error: error));
    }
  }
}
