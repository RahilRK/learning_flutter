/// websiteId : 1
/// storeId : 1
/// quoteId : 0
/// mobilenumber : "540577786"
/// os : "android"

class VerificationRequest {
  VerificationRequest({
      String? websiteId, 
      String? storeId, 
      String? quoteId, 
      String? mobilenumber, 
      String? os,}){
    _websiteId = websiteId;
    _storeId = storeId;
    _quoteId = quoteId;
    _mobilenumber = mobilenumber;
    _os = os;
}

  VerificationRequest.fromJson(dynamic json) {
    _websiteId = json['websiteId'];
    _storeId = json['storeId'];
    _quoteId = json['quoteId'];
    _mobilenumber = json['mobilenumber'];
    _os = json['os'];
  }
  String? _websiteId;
  String? _storeId;
  String? _quoteId;
  String? _mobilenumber;
  String? _os;
VerificationRequest copyWith({  String? websiteId,
  String? storeId,
  String? quoteId,
  String? mobilenumber,
  String? os,
}) => VerificationRequest(  websiteId: websiteId ?? _websiteId,
  storeId: storeId ?? _storeId,
  quoteId: quoteId ?? _quoteId,
  mobilenumber: mobilenumber ?? _mobilenumber,
  os: os ?? _os,
);
  String? get websiteId => _websiteId;
  String? get storeId => _storeId;
  String? get quoteId => _quoteId;
  String? get mobilenumber => _mobilenumber;
  String? get os => _os;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['websiteId'] = _websiteId;
    map['storeId'] = _storeId;
    map['quoteId'] = _quoteId;
    map['mobilenumber'] = _mobilenumber;
    map['os'] = _os;
    return map;
  }

}