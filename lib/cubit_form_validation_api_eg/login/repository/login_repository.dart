import 'package:dio/dio.dart';
import 'package:learning_flutter/cubit_form_validation_api_eg/login/model/LoginResponseModel.dart';

import '../model/LoginRequestModel.dart';
import '../provider/login_provider.dart';

abstract class ILoginRepository {

  Future<Response> doLogin(LoginRequestModel requestModel);
}

class LoginRepository implements ILoginRepository {

  final LoginProvider loginProvider;

  LoginRepository(this.loginProvider);

  @override
  Future<Response> doLogin(LoginRequestModel requestModel) {

    return loginProvider.doLogin(requestModel);
  }

}