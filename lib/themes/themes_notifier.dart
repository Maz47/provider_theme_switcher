import 'package:flutter/material.dart';
import './my_theme.dart';
import './themes.dart';

class ThemesNotifier extends ChangeNotifier {

  MyTheme _currentTheme = kRedTheme;

  MyTheme get currentTheme => _currentTheme;

  void updateTheme(MyTheme newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }
}
