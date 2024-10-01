part of 'email_login_cubit.dart';

abstract class UnitedPharaEmailLoginState {
  final bool passwordVisible;
  UnitedPharaEmailLoginState({required this.passwordVisible});
}

final class EmailLoginInitialState extends UnitedPharaEmailLoginState {
  EmailLoginInitialState({required super.passwordVisible});
}

final class EmailLoginLoadingState extends UnitedPharaEmailLoginState {
  EmailLoginLoadingState({required super.passwordVisible});
}

final class EmailLoginSuccessState extends UnitedPharaEmailLoginState {
  final LoginResponse loginResponseModel;

  EmailLoginSuccessState({required super.passwordVisible, required this.loginResponseModel});
}

final class EmailLoginErrorState extends UnitedPharaEmailLoginState {
  final String error;

  EmailLoginErrorState({required super.passwordVisible, required this.error});
}
