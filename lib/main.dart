import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/my_theme.dart';

import 'home_screen/quran/surah_name_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahNameDetails.routeName: (context) => SurahNameDetails(),
      },
      theme: MyTheme.darkTheme,
      //darkTheme: MyTheme.darkTheme,
    );
  }
}
