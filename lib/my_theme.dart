import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);

  static Color whiteColor = const Color(0xffF8F8F8);

  static Color goldColor = const Color(0xffB7935F);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
