import 'package:flutter/material.dart';

class AppColors {
  static Color grey =  const Color(0xfff5f5f5);
  static Color lightGreen = const Color(0xfff1f6f2);
  static Color darkGreen = const Color(0xff4c8e4b);
  //static Color offGreen = const Color(0xffEDF1D6);
}

class Themes {

  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightGreen,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.lightGreen,
          iconTheme: IconThemeData(
              color: AppColors.darkGreen
          ),
          titleTextStyle: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: AppColors.darkGreen
          )
      ),
      colorScheme: ColorScheme.light(
          primary: AppColors.darkGreen,
          secondary: AppColors.lightGreen,
      )
  );

}

class TextStyles {

  static TextStyle heading1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      fontSize: 48
  );

  static TextStyle heading2 = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      fontSize: 32
  );

  static TextStyle heading3 = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      fontSize: 24
  );

  static TextStyle body1 = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 18
  );

  static TextStyle body2 = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
      color: Colors.grey,
      fontSize: 16
  );

}
