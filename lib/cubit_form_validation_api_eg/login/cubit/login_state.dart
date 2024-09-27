part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccessState(this.loginResponseModel);
}

final class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}
