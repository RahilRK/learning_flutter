/// currency : "SAR"
/// websiteId : "1"
/// width : "1080.000000"
/// is_home_brands : "1"
/// eTag : ""
/// city : "Jeddah"
/// storeId : 1
/// quoteId : 0
/// os : "android"

class HomePageDataFirstRequest {
  HomePageDataFirstRequest({
      String? currency, 
      String? websiteId, 
      String? width, 
      String? isHomeBrands, 
      String? eTag, 
      String? city, 
      String? storeId, 
      String? quoteId, 
      String? os,}){
    _currency = currency;
    _websiteId = websiteId;
    _width = width;
    _isHomeBrands = isHomeBrands;
    _eTag = eTag;
    _city = city;
    _storeId = storeId;
    _quoteId = quoteId;
    _os = os;
}

  HomePageDataFirstRequest.fromJson(dynamic json) {
    _currency = json['currency'];
    _websiteId = json['websiteId'];
    _width = json['width'];
    _isHomeBrands = json['is_home_brands'];
    _eTag = json['eTag'];
    _city = json['city'];
    _storeId = json['storeId'];
    _quoteId = json['quoteId'];
    _os = json['os'];
  }
  String? _currency;
  String? _websiteId;
  String? _width;
  String? _isHomeBrands;
  String? _eTag;
  String? _city;
  String? _storeId;
  String? _quoteId;
  String? _os;
HomePageDataFirstRequest copyWith({  String? currency,
  String? websiteId,
  String? width,
  String? isHomeBrands,
  String? eTag,
  String? city,
  String? storeId,
  String? quoteId,
  String? os,
}) => HomePageDataFirstRequest(  currency: currency ?? _currency,
  websiteId: websiteId ?? _websiteId,
  width: width ?? _width,
  isHomeBrands: isHomeBrands ?? _isHomeBrands,
  eTag: eTag ?? _eTag,
  city: city ?? _city,
  storeId: storeId ?? _storeId,
  quoteId: quoteId ?? _quoteId,
  os: os ?? _os,
);
  String? get currency => _currency;
  String? get websiteId => _websiteId;
  String? get width => _width;
  String? get isHomeBrands => _isHomeBrands;
  String? get eTag => _eTag;
  String? get city => _city;
  String? get storeId => _storeId;
  String? get quoteId => _quoteId;
  String? get os => _os;

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['currency'] = _currency??"";
    map['websiteId'] = _websiteId??"";
    map['width'] = _width??"";
    map['is_home_brands'] = _isHomeBrands??"";
    map['eTag'] = _eTag??"";
    map['city'] = _city??"";
    map['storeId'] = _storeId??"";
    map['quoteId'] = _quoteId??"";
    map['os'] = _os??"";
    return map;
  }

}