import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

import 'home_screen/quran/surah_name_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahNameDetails.routeName: (context) => SurahNameDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appMode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}
