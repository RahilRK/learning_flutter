
import 'package:learning_flutter/united_pharmacy_cubit/model/request/LoginRequest.dart';
import 'package:learning_flutter/united_pharmacy_cubit/model/response/LoginResponse.dart';

import '../provider/email_login_provider.dart';

abstract class IEmailLoginRepository {

  Future<LoginResponse> logIn(LoginRequest requestModel);
}

class UnitedPharaEmailLoginRepository implements IEmailLoginRepository {

  final UnitedPharaEmailLoginProvider loginProvider;

  UnitedPharaEmailLoginRepository(this.loginProvider);

  @override
  Future<LoginResponse> logIn(LoginRequest requestModel) {

    return loginProvider.logIn(requestModel);
    // return loginProvider.logInHttp(requestModel);
  }

}