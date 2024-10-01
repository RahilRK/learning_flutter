
import '../../../united_pharmacy_cubit/model/request/LoginRequest.dart';
import '../../../united_pharmacy_cubit/model/response/LoginResponse.dart';
import '../provider/mobile_no_login_provider.dart';

abstract class IMobNoLoginRepository {

  Future<LoginResponse> logIn(LoginRequest requestModel);
}

class UnitedPharaMobNoLoginRepository implements IMobNoLoginRepository {

  final UnitedPharaMobNoLoginProvider loginProvider;

  UnitedPharaMobNoLoginRepository(this.loginProvider);

  @override
  Future<LoginResponse> logIn(LoginRequest requestModel) {

    return loginProvider.logIn(requestModel);
  }
}