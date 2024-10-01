/// success : false
/// message : "Customer Already Exist"
/// OTP : "NOT SEND"

class VerificationResponse {
  VerificationResponse({
      bool? success, 
      String? message, 
      String otp = "",}){
    _success = success;
    _message = message;
    _otp = otp;
}

  VerificationResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _otp = json['OTP'];
  }
  bool? _success;
  String? _message;
  String _otp = "";
VerificationResponse copyWith({  bool? success,
  String? message,
  String? otp,
}) => VerificationResponse(  success: success ?? _success,
  message: message ?? _message,
  otp: otp ?? _otp,
);
  bool? get success => _success;
  String? get message => _message;
  String get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['OTP'] = _otp;
    return map;
  }

}