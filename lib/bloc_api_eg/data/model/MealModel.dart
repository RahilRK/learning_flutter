/// meals : [{"strMeal":"BeaverTails","strMealThumb":"https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg","idMeal":"52928"},{"strMeal":"Breakfast Potatoes","strMealThumb":"https://www.themealdb.com/images/media/meals/1550441882.jpg","idMeal":"52965"},{"strMeal":"Canadian Butter Tarts","strMealThumb":"https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg","idMeal":"52923"},{"strMeal":"Montreal Smoked Meat","strMealThumb":"https://www.themealdb.com/images/media/meals/uttupv1511815050.jpg","idMeal":"52927"},{"strMeal":"Nanaimo Bars","strMealThumb":"https://www.themealdb.com/images/media/meals/vwuprt1511813703.jpg","idMeal":"52924"},{"strMeal":"Pate Chinois","strMealThumb":"https://www.themealdb.com/images/media/meals/yyrrxr1511816289.jpg","idMeal":"52930"},{"strMeal":"Pouding chomeur","strMealThumb":"https://www.themealdb.com/images/media/meals/yqqqwu1511816912.jpg","idMeal":"52932"},{"strMeal":"Poutine","strMealThumb":"https://www.themealdb.com/images/media/meals/uuyrrx1487327597.jpg","idMeal":"52804"},{"strMeal":"Rappie Pie","strMealThumb":"https://www.themealdb.com/images/media/meals/ruwpww1511817242.jpg","idMeal":"52933"},{"strMeal":"Split Pea Soup","strMealThumb":"https://www.themealdb.com/images/media/meals/xxtsvx1511814083.jpg","idMeal":"52925"},{"strMeal":"Sugar Pie","strMealThumb":"https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg","idMeal":"52931"},{"strMeal":"Timbits","strMealThumb":"https://www.themealdb.com/images/media/meals/txsupu1511815755.jpg","idMeal":"52929"},{"strMeal":"Tourtiere","strMealThumb":"https://www.themealdb.com/images/media/meals/ytpstt1511814614.jpg","idMeal":"52926"}]

class MealModel {
  MealModel({
      List<Meals>? meals,}){
    _meals = meals;
}

  MealModel.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }
  List<Meals>? _meals;
MealModel copyWith({  List<Meals>? meals,
}) => MealModel(  meals: meals ?? _meals,
);
  List<Meals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strMeal : "BeaverTails"
/// strMealThumb : "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg"
/// idMeal : "52928"

class Meals {
  Meals({
      String? strMeal, 
      String? strMealThumb, 
      String? idMeal,}){
    _strMeal = strMeal;
    _strMealThumb = strMealThumb;
    _idMeal = idMeal;
}

  Meals.fromJson(dynamic json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }
  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;
Meals copyWith({  String? strMeal,
  String? strMealThumb,
  String? idMeal,
}) => Meals(  strMeal: strMeal ?? _strMeal,
  strMealThumb: strMealThumb ?? _strMealThumb,
  idMeal: idMeal ?? _idMeal,
);
  String? get strMeal => _strMeal;
  String? get strMealThumb => _strMealThumb;
  String? get idMeal => _idMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strMeal'] = _strMeal;
    map['strMealThumb'] = _strMealThumb;
    map['idMeal'] = _idMeal;
    return map;
  }

}