/// websiteId : 1
/// storeId : 1
/// quoteId : 0
/// mFactor : 2.625
/// currency : "SAR"
/// username : "rahil.mithani@brainvire.com"
/// password : "Abcd@1234"
/// os : "android"

class LoginRequest {
  LoginRequest({
    String? websiteId,
    String? storeId,
    String? quoteId,
    String? mFactor,
    String? currency,
    String? username,
    String? mobile,
    String? password,
    String? os,
  }) {
    _websiteId = websiteId;
    _storeId = storeId;
    _quoteId = quoteId;
    _mFactor = mFactor;
    _currency = currency;
    _username = username;
    _mobile = mobile;
    _password = password;
    _os = os;
  }

  LoginRequest.fromJson(dynamic json) {
    _websiteId = json['websiteId'];
    _storeId = json['storeId'];
    _quoteId = json['quoteId'];
    _mFactor = json['mFactor'];
    _currency = json['currency'];
    _username = json['username'];
    _mobile = json['mobile'];
    _password = json['password'];
    _os = json['os'];
  }

  String? _websiteId;
  String? _storeId;
  String? _quoteId;
  String? _mFactor;
  String? _currency;
  String? _username;
  String? _mobile;
  String? _password;
  String? _os;

  LoginRequest copyWith({
    String? websiteId,
    String? storeId,
    String? quoteId,
    String? mFactor,
    String? currency,
    String? username,
    String? mobile,
    String? password,
    String? os,
  }) =>
      LoginRequest(
        websiteId: websiteId ?? _websiteId,
        storeId: storeId ?? _storeId,
        quoteId: quoteId ?? _quoteId,
        mFactor: mFactor ?? _mFactor,
        currency: currency ?? _currency,
        username: username ?? _username,
        mobile: mobile ?? _mobile,
        password: password ?? _password,
        os: os ?? _os,
      );

  String? get websiteId => _websiteId;

  String? get storeId => _storeId;

  String? get quoteId => _quoteId;

  String? get mFactor => _mFactor;

  String? get currency => _currency;

  String? get username => _username;

  String? get mobile => mobile;

  String? get password => _password;

  String? get os => _os;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['websiteId'] = _websiteId;
    map['storeId'] = _storeId;
    map['quoteId'] = _quoteId;
    map['mFactor'] = _mFactor;
    map['currency'] = _currency;
    map['username'] = _username;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['os'] = _os;
    return map;
  }
}
