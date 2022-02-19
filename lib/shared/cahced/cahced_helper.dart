import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static late SharedPreferences _sharedPreferences;
  static initializedShared() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static setData({required key, required value}) {
    if (value is String) {
      return _sharedPreferences.setString(key, value).then((value) {
        print(value);
      }).catchError((error) {
        print('Error $error');
      });
    } else if (value is bool) {
      return _sharedPreferences.setBool(key, value).then((value) {
        print(value);
      }).catchError((error) {
        print('Error $error');
      });
    } else if (value is int) {
      return _sharedPreferences.setInt(key, value).then((value) {
        print(value);
      }).catchError((error) {
        print('Error $error');
      });
    } else if (value is double) {
      return _sharedPreferences.setDouble(key, value).then((value) {
        print(value);
      }).catchError((error) {
        print('Error $error');
      });
    }

    return _sharedPreferences.setStringList(key, value).then((value) {
      print(value);
    }).catchError((error) {
      print('Error $error');
    });
  }

  static getData({required key}) {
    return _sharedPreferences.get(key);
  }
}
