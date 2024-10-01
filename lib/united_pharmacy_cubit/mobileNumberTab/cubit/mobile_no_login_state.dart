


import 'package:learning_flutter/united_pharmacy_cubit/model/response/LoginResponse.dart';

abstract class UnitedPharaMobNoLoginState {
  final bool passwordVisible;
  UnitedPharaMobNoLoginState({required this.passwordVisible});
}

final class MobNoLoginInitialState extends UnitedPharaMobNoLoginState {
  MobNoLoginInitialState({required super.passwordVisible});
}

final class MobNoLoginLoadingState extends UnitedPharaMobNoLoginState {
  MobNoLoginLoadingState({required super.passwordVisible});
}

final class MobNoLoginSuccessState extends UnitedPharaMobNoLoginState {
  final LoginResponse loginResponseModel;

  MobNoLoginSuccessState({required super.passwordVisible, required this.loginResponseModel});
}

final class MobNoLoginErrorState extends UnitedPharaMobNoLoginState {
  final String error;

  MobNoLoginErrorState({required super.passwordVisible, required this.error});
}
