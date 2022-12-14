import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/hadeth/hadeth.dart';
import 'package:islami_app/home_screen/quran/quran.dart';
import 'package:islami_app/home_screen/radio/radio.dart';
import 'package:islami_app/home_screen/sebah/sebah.dart';
import 'package:islami_app/home_screen/settings/settings.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screen = [
    QuranScreen(),
    HadethScreen(),
    SebahScreen(),
    RadioScreen(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                'assets/images/background_image_night.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/background_image.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          bottomNavigationBar: Theme(
            data: provider.isDarkMode()
                ? Theme.of(context).copyWith(canvasColor: MyTheme.darkColor)
                : Theme.of(context).copyWith(canvasColor: MyTheme.goldColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/quran.png'),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/hadeth.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/sebha.png'),
                    ),
                    label: AppLocalizations.of(context)!.sebah),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: screen[currentIndex],
        ),
      ],
    );
  }
}
