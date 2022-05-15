import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({
    required bool isModoOscuro,
  }) : currentTheme = isModoOscuro ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
