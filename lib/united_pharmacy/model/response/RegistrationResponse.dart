/// success : true
/// message : "Your Account has been created successfully"
/// customerName : "test user"
/// customerId : "306285"
/// cartCount : 0
/// customerEmail : "rahil.mithani+1@brainvire.com"
/// customerToken : "ig1rpqand3rnw3796doi0tiglvqkndaq"
/// social_media : ""
/// mobile_number : "566666610"
/// bannerImage : ""
/// profileImage : ""

class RegistrationResponse {
  RegistrationResponse({
      bool? success, 
      String? message, 
      String? customerName, 
      String? customerId, 
      num? cartCount, 
      String? customerEmail, 
      String? customerToken, 
      String? socialMedia, 
      String? mobileNumber, 
      String? bannerImage, 
      String? profileImage,}){
    _success = success;
    _message = message;
    _customerName = customerName;
    _customerId = customerId;
    _cartCount = cartCount;
    _customerEmail = customerEmail;
    _customerToken = customerToken;
    _socialMedia = socialMedia;
    _mobileNumber = mobileNumber;
    _bannerImage = bannerImage;
    _profileImage = profileImage;
}

  RegistrationResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _customerName = json['customerName'];
    _customerId = json['customerId'];
    _cartCount = json['cartCount'];
    _customerEmail = json['customerEmail'];
    _customerToken = json['customerToken'];
    _socialMedia = json['social_media'];
    _mobileNumber = json['mobile_number'];
    _bannerImage = json['bannerImage'];
    _profileImage = json['profileImage'];
  }
  bool? _success;
  String? _message;
  String? _customerName;
  String? _customerId;
  num? _cartCount;
  String? _customerEmail;
  String? _customerToken;
  String? _socialMedia;
  String? _mobileNumber;
  String? _bannerImage;
  String? _profileImage;
RegistrationResponse copyWith({  bool? success,
  String? message,
  String? customerName,
  String? customerId,
  num? cartCount,
  String? customerEmail,
  String? customerToken,
  String? socialMedia,
  String? mobileNumber,
  String? bannerImage,
  String? profileImage,
}) => RegistrationResponse(  success: success ?? _success,
  message: message ?? _message,
  customerName: customerName ?? _customerName,
  customerId: customerId ?? _customerId,
  cartCount: cartCount ?? _cartCount,
  customerEmail: customerEmail ?? _customerEmail,
  customerToken: customerToken ?? _customerToken,
  socialMedia: socialMedia ?? _socialMedia,
  mobileNumber: mobileNumber ?? _mobileNumber,
  bannerImage: bannerImage ?? _bannerImage,
  profileImage: profileImage ?? _profileImage,
);
  bool? get success => _success;
  String? get message => _message;
  String? get customerName => _customerName;
  String? get customerId => _customerId;
  num? get cartCount => _cartCount;
  String? get customerEmail => _customerEmail;
  String? get customerToken => _customerToken;
  String? get socialMedia => _socialMedia;
  String? get mobileNumber => _mobileNumber;
  String? get bannerImage => _bannerImage;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['customerName'] = _customerName;
    map['customerId'] = _customerId;
    map['cartCount'] = _cartCount;
    map['customerEmail'] = _customerEmail;
    map['customerToken'] = _customerToken;
    map['social_media'] = _socialMedia;
    map['mobile_number'] = _mobileNumber;
    map['bannerImage'] = _bannerImage;
    map['profileImage'] = _profileImage;
    return map;
  }

}