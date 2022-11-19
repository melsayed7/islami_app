import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/quran/surah_name.dart';

class SurahNameDetails extends StatelessWidget {
  static const String routeName = 'surah_name_details';

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as SurahNameDetailsArgs;
    return Stack(children: [
      Image.asset(
        'assets/images/background_image.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    ]);
  }
}
