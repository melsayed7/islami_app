import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/quran/surah_name_details.dart';

class SurahName extends StatelessWidget {
  static const String routeName = 'surah_name';
  String name;

  int index;

  SurahName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SurahNameDetails.routeName,
            arguments: SurahNameDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: Theme.of(context).primaryTextTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SurahNameDetailsArgs {
  String name;

  int index;

  SurahNameDetailsArgs({required this.name, required this.index});
}
