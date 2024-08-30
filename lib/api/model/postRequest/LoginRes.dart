/// token : "QpwL5tke4Pnpja7X4"

class LoginRes {
  LoginRes({
      String? token,}){
    _token = token;
}

  LoginRes.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
LoginRes copyWith({  String? token,
}) => LoginRes(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}