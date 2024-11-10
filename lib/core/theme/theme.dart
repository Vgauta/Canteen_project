import 'package:flutter/material.dart';
import 'color_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColorPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorPallete.backgroundColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.0,
        color: AppColorPallete.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColorPallete.backgroundColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColorPallete.backgroundColor,
      elevation: 0,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorPallete.primaryColor,
      contentTextStyle: TextStyle(
        color: AppColorPallete.whiteColor,
        fontSize: 16,
      ),
    ),
    hintColor: AppColorPallete.whiteColor,
    dividerColor: AppColorPallete.whiteColor,
  );

  static final brightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColorPallete.whiteColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.0,
        color: AppColorPallete.blackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColorPallete.whiteColor,
      elevation: 0,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorPallete.primaryColor,
      contentTextStyle: TextStyle(
        color: AppColorPallete.whiteColor,
        fontSize: 16,
      ),
    ),
    hintColor: AppColorPallete.blackColor,
    dividerColor: AppColorPallete.blackColor,
  );
}
