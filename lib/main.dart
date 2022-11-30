import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_item_content.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen/quran/surah_name_details.dart';

String saveLanguage = 'en';
ThemeMode saveMode = ThemeMode.light;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  saveLanguage = prefs.getString('language') ?? '';
  if (prefs.getString('mode') == 'light') {
    saveMode = ThemeMode.light;
  } else if (prefs.getString('mode') == 'dark') {
    saveMode = ThemeMode.dark;
  }
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: MyApp(),
    ),
  );
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
        HadethItemContent.routeName: (context) => HadethItemContent(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appMode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }

/*void getSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
    saveLanguage = prefs.getString('language') ?? '';
    if(prefs.getString('mode') == 'light'){
      appProvider?.changeMode(ThemeMode.light);
    }else if(prefs.getString('mode') == 'dark'){
      appProvider?.changeMode(ThemeMode.dark);
    }
  }*/
}
