/// banners : [{"url":"https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559390.jpg","title":"Best Deals Offline","bannerType":"category","dominantColor":"#deaa9f","startDate":"2024-09-18 00:00:00","endDate":"2024-09-30 23:59:00","img_title":null,"sub_title":null,"id":"5081","name":"Mouth Wash Offers"},{"url":"https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559544.jpg","title":"Best Deals Offline","bannerType":"category","dominantColor":"#dcafa3","startDate":"2024-09-18 00:00:00","endDate":"2024-09-30 23:59:00","img_title":null,"sub_title":null,"id":"5151","name":"Hair conditioner offers"},{"url":"https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559704.jpg","title":"Best Deals Offline","bannerType":"category","dominantColor":"#dbaba0","startDate":"2024-09-18 00:00:00","endDate":"2024-09-30 23:59:00","img_title":null,"sub_title":null,"id":"4774","name":"Deodorant offers "},{"url":"https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559826.jpg","title":"Best Deals Offline","bannerType":"category","dominantColor":"#dfaea4","startDate":"2024-09-18 00:00:00","endDate":"2024-09-30 23:59:00","img_title":null,"sub_title":null,"id":"894","name":"shampoo Offers"}]

class Demo {
  Demo({
      List<Banners>? banners,}){
    _banners = banners;
}

  Demo.fromJson(dynamic json) {
    if (json['banners'] != null) {
      _banners = [];
      json['banners'].forEach((v) {
        _banners?.add(Banners.fromJson(v));
      });
    }
  }
  List<Banners>? _banners;
Demo copyWith({  List<Banners>? banners,
}) => Demo(  banners: banners ?? _banners,
);
  List<Banners>? get banners => _banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_banners != null) {
      map['banners'] = _banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// url : "https://unitedpharmacy.sa/media/mobikul/carouselimages/File-1726559390.jpg"
/// title : "Best Deals Offline"
/// bannerType : "category"
/// dominantColor : "#deaa9f"
/// startDate : "2024-09-18 00:00:00"
/// endDate : "2024-09-30 23:59:00"
/// img_title : null
/// sub_title : null
/// id : "5081"
/// name : "Mouth Wash Offers"

class Banners {
  Banners({
      String? url, 
      String? title, 
      String? bannerType, 
      String? dominantColor, 
      String? startDate, 
      String? endDate, 
      dynamic imgTitle, 
      dynamic subTitle, 
      String? id, 
      String? name,}){
    _url = url;
    _title = title;
    _bannerType = bannerType;
    _dominantColor = dominantColor;
    _startDate = startDate;
    _endDate = endDate;
    _imgTitle = imgTitle;
    _subTitle = subTitle;
    _id = id;
    _name = name;
}

  Banners.fromJson(dynamic json) {
    _url = json['url'];
    _title = json['title'];
    _bannerType = json['bannerType'];
    _dominantColor = json['dominantColor'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _imgTitle = json['img_title'];
    _subTitle = json['sub_title'];
    _id = json['id'];
    _name = json['name'];
  }
  String? _url;
  String? _title;
  String? _bannerType;
  String? _dominantColor;
  String? _startDate;
  String? _endDate;
  dynamic _imgTitle;
  dynamic _subTitle;
  String? _id;
  String? _name;
Banners copyWith({  String? url,
  String? title,
  String? bannerType,
  String? dominantColor,
  String? startDate,
  String? endDate,
  dynamic imgTitle,
  dynamic subTitle,
  String? id,
  String? name,
}) => Banners(  url: url ?? _url,
  title: title ?? _title,
  bannerType: bannerType ?? _bannerType,
  dominantColor: dominantColor ?? _dominantColor,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  imgTitle: imgTitle ?? _imgTitle,
  subTitle: subTitle ?? _subTitle,
  id: id ?? _id,
  name: name ?? _name,
);
  String? get url => _url;
  String? get title => _title;
  String? get bannerType => _bannerType;
  String? get dominantColor => _dominantColor;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  dynamic get imgTitle => _imgTitle;
  dynamic get subTitle => _subTitle;
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['title'] = _title;
    map['bannerType'] = _bannerType;
    map['dominantColor'] = _dominantColor;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['img_title'] = _imgTitle;
    map['sub_title'] = _subTitle;
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}