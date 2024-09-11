/// success : true
/// message : ""
/// customerName : "rahil mithani"
/// customerEmail : "rahil.mithani@brainvire.com"
/// mobile_number : "540577786"
/// social_media : null
/// customerId : "306283"
/// customerToken : "3fynzyuvqo7ze1z28hh349q99c4mracv"
/// bannerImage : ""
/// profileImage : ""
/// cartCount : 0
/// wishlistCount : 0

class LoginResponse {
  LoginResponse({
      bool? success, 
      String? message, 
      String? customerName, 
      String? customerEmail, 
      String? mobileNumber, 
      dynamic socialMedia, 
      String? customerId, 
      String? customerToken, 
      String? bannerImage, 
      String? profileImage, 
      num? cartCount, 
      num? wishlistCount,}){
    _success = success;
    _message = message;
    _customerName = customerName;
    _customerEmail = customerEmail;
    _mobileNumber = mobileNumber;
    _socialMedia = socialMedia;
    _customerId = customerId;
    _customerToken = customerToken;
    _bannerImage = bannerImage;
    _profileImage = profileImage;
    _cartCount = cartCount;
    _wishlistCount = wishlistCount;
}

  LoginResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _customerName = json['customerName'];
    _customerEmail = json['customerEmail'];
    _mobileNumber = json['mobile_number'];
    _socialMedia = json['social_media'];
    _customerId = json['customerId'];
    _customerToken = json['customerToken'];
    _bannerImage = json['bannerImage'];
    _profileImage = json['profileImage'];
    _cartCount = json['cartCount'];
    _wishlistCount = json['wishlistCount'];
  }
  bool? _success;
  String? _message;
  String? _customerName;
  String? _customerEmail;
  String? _mobileNumber;
  dynamic _socialMedia;
  String? _customerId;
  String? _customerToken;
  String? _bannerImage;
  String? _profileImage;
  num? _cartCount;
  num? _wishlistCount;
LoginResponse copyWith({  bool? success,
  String? message,
  String? customerName,
  String? customerEmail,
  String? mobileNumber,
  dynamic socialMedia,
  String? customerId,
  String? customerToken,
  String? bannerImage,
  String? profileImage,
  num? cartCount,
  num? wishlistCount,
}) => LoginResponse(  success: success ?? _success,
  message: message ?? _message,
  customerName: customerName ?? _customerName,
  customerEmail: customerEmail ?? _customerEmail,
  mobileNumber: mobileNumber ?? _mobileNumber,
  socialMedia: socialMedia ?? _socialMedia,
  customerId: customerId ?? _customerId,
  customerToken: customerToken ?? _customerToken,
  bannerImage: bannerImage ?? _bannerImage,
  profileImage: profileImage ?? _profileImage,
  cartCount: cartCount ?? _cartCount,
  wishlistCount: wishlistCount ?? _wishlistCount,
);
  bool? get success => _success;
  String? get message => _message;
  String? get customerName => _customerName;
  String? get customerEmail => _customerEmail;
  String? get mobileNumber => _mobileNumber;
  dynamic get socialMedia => _socialMedia;
  String? get customerId => _customerId;
  String? get customerToken => _customerToken;
  String? get bannerImage => _bannerImage;
  String? get profileImage => _profileImage;
  num? get cartCount => _cartCount;
  num? get wishlistCount => _wishlistCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['customerName'] = _customerName;
    map['customerEmail'] = _customerEmail;
    map['mobile_number'] = _mobileNumber;
    map['social_media'] = _socialMedia;
    map['customerId'] = _customerId;
    map['customerToken'] = _customerToken;
    map['bannerImage'] = _bannerImage;
    map['profileImage'] = _profileImage;
    map['cartCount'] = _cartCount;
    map['wishlistCount'] = _wishlistCount;
    return map;
  }

}