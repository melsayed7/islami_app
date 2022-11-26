import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);

  static Color whiteColor = const Color(0xffF8F8F8);

  static Color goldColor = const Color(0xffB7935F);

  static Color bgNavBarColor = const Color(0xff141A2E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: goldColor,
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
        headline2: TextStyle(
          color: blackColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: bgNavBarColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: whiteColor,
        )),
    textTheme: TextTheme(
        headline1: TextStyle(
          color: whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: goldColor,
      unselectedItemColor: whiteColor,
    ),
  );
}
