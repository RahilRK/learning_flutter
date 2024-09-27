/// token : "QpwL5tke4Pnpja7X4"
/// error : "Missing password"

class LoginResponseModel {
  LoginResponseModel({
      String? token, 
      String? error,}){
    _token = token;
    _error = error;
}

  LoginResponseModel.fromJson(dynamic json) {
    _token = json['token'];
    _error = json['error'];
  }
  String? _token;
  String? _error;
LoginResponseModel copyWith({  String? token,
  String? error,
}) => LoginResponseModel(  token: token ?? _token,
  error: error ?? _error,
);
  String? get token => _token;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['error'] = _error;
    return map;
  }

}