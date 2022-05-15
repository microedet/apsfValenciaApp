import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isModoOscuro = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isModoOscuro {
    return _prefs.getBool('isModoOscuro') ?? _isModoOscuro;
  }

  static set isModoOscuro(bool value) {
    _isModoOscuro = isModoOscuro;
    _prefs.setBool('isModoOscuro', value);
  }

  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int value) {
    _genero = value;
    _prefs.setInt('genero', value);
  }
}
