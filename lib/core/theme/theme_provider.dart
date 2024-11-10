import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _theme = ThemeData.light();
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get themeData => _theme;

  dynamic toggleTheme(bool isDark) {
    _isDark = isDark;
    if (_theme == AppTheme.darkThemeMode) {
      _isDark = false;
    }
    _theme = _isDark ? AppTheme.darkThemeMode : AppTheme.brightThemeMode;
    notifyListeners();
  }
}
