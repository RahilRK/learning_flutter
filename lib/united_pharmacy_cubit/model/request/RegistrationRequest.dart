/// websiteId : ""
/// storeId : ""
/// quoteId : ""
/// mFactor : ""
/// Currency : "SAR"
/// firstName : "rahil"
/// lastName : "mithani"
/// OTP : "396721"
/// email : "rahil.mithani@brainvire.com"
/// password : "Abcd@1234"
/// pictureURL : ""
/// mobile : "540577786"
/// os : "android"

class RegistrationRequest {
  RegistrationRequest({
      String? websiteId, 
      String? storeId, 
      String? quoteId, 
      String? mFactor, 
      String? currency, 
      String? firstName, 
      String? lastName, 
      String? otp, 
      String? email, 
      String? password, 
      String? pictureURL, 
      String? mobile, 
      String? os,}){
    _websiteId = websiteId;
    _storeId = storeId;
    _quoteId = quoteId;
    _mFactor = mFactor;
    _currency = currency;
    _firstName = firstName;
    _lastName = lastName;
    _otp = otp;
    _email = email;
    _password = password;
    _pictureURL = pictureURL;
    _mobile = mobile;
    _os = os;
}

  RegistrationRequest.fromJson(dynamic json) {
    _websiteId = json['websiteId'];
    _storeId = json['storeId'];
    _quoteId = json['quoteId'];
    _mFactor = json['mFactor'];
    _currency = json['Currency'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _otp = json['OTP'];
    _email = json['email'];
    _password = json['password'];
    _pictureURL = json['pictureURL'];
    _mobile = json['mobile'];
    _os = json['os'];
  }
  String? _websiteId;
  String? _storeId;
  String? _quoteId;
  String? _mFactor;
  String? _currency;
  String? _firstName;
  String? _lastName;
  String? _otp;
  String? _email;
  String? _password;
  String? _pictureURL;
  String? _mobile;
  String? _os;
RegistrationRequest copyWith({  String? websiteId,
  String? storeId,
  String? quoteId,
  String? mFactor,
  String? currency,
  String? firstName,
  String? lastName,
  String? otp,
  String? email,
  String? password,
  String? pictureURL,
  String? mobile,
  String? os,
}) => RegistrationRequest(  websiteId: websiteId ?? _websiteId,
  storeId: storeId ?? _storeId,
  quoteId: quoteId ?? _quoteId,
  mFactor: mFactor ?? _mFactor,
  currency: currency ?? _currency,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  otp: otp ?? _otp,
  email: email ?? _email,
  password: password ?? _password,
  pictureURL: pictureURL ?? _pictureURL,
  mobile: mobile ?? _mobile,
  os: os ?? _os,
);
  String? get websiteId => _websiteId;
  String? get storeId => _storeId;
  String? get quoteId => _quoteId;
  String? get mFactor => _mFactor;
  String? get currency => _currency;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get otp => _otp;
  String? get email => _email;
  String? get password => _password;
  String? get pictureURL => _pictureURL;
  String? get mobile => _mobile;
  String? get os => _os;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['websiteId'] = _websiteId;
    map['storeId'] = _storeId;
    map['quoteId'] = _quoteId;
    map['mFactor'] = _mFactor;
    map['Currency'] = _currency;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['OTP'] = _otp;
    map['email'] = _email;
    map['password'] = _password;
    map['pictureURL'] = _pictureURL;
    map['mobile'] = _mobile;
    map['os'] = _os;
    return map;
  }

}