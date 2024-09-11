import 'package:shared_preferences/shared_preferences.dart';

abstract class MyPref {

  static addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = await prefs.getString(key)??"";
    return stringValue;
  }

  static getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  static getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }
}