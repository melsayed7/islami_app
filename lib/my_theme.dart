import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);

  static Color whiteColor = const Color(0xffF8F8F8);

  static Color goldColor = const Color(0xffB7935F);

  static Color darkColor = const Color(0xff141A2E);

  static Color yellowColor = const Color(0xffFACC1D);

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
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: blackColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: blackColor,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: TextStyle(
        color: whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: whiteColor,
        )),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: yellowColor,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: TextStyle(
        color: blackColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
  );
}
