import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefencesService {
  late SharedPreferences _preferences;


  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> deleteData(String title) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.remove(title);
  }

  Future<void> saveData(String title, String text) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(title, text);
  }

  Future<String?> getData(String title)async{
    _preferences = await SharedPreferences.getInstance();

    return _preferences.getString(title);
  }

  Future<Map<String, String>> getAllData() async {
  _preferences = await SharedPreferences.getInstance();
  final keys = _preferences.getKeys();
  Map<String, String> allData = {};
  for (var key in keys) {
    final value = _preferences.getString(key);
    if (value != null) {
      allData[key] = value;
    }
  }
  return allData;
}
}
