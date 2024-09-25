/// a : "country"

class RequestMealModel {
  RequestMealModel({
      String? a,}){
    _a = a;
}

  RequestMealModel.fromJson(dynamic json) {
    _a = json['a'];
  }
  String? _a;
RequestMealModel copyWith({  String? a,
}) => RequestMealModel(  a: a ?? _a,
);
  String? get a => _a;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['a'] = _a;
    return map;
  }

}