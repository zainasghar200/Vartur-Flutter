import 'package:flutter/material.dart';
import 'package:vartur_assignment/shared/colors.dart';

class VartureTheme {
  static ThemeData get standard {
    return ThemeData(
      fontFamily: 'Montserrat',
      // useMaterial3: true,
      primaryColor: VarturColors.mainColor,
      bottomAppBarTheme: const BottomAppBarTheme(
          color: VarturColors.white,
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0)),

      appBarTheme: AppBarTheme(
        color: VarturColors.mainColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: VarturColors.mainColor,
      ),
      brightness: Brightness.light,
      highlightColor: VarturColors.secondaryColor,
      indicatorColor: VarturColors.mainColor,
      focusColor: VarturColors.secondaryColor,
    );
  }
}
