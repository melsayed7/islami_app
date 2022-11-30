import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home_screen/quran/surah_name.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

import 'item_surah_name_details.dart';

class SurahNameDetails extends StatefulWidget {
  static const String routeName = 'surah_name_details';

  @override
  State<SurahNameDetails> createState() => _SurahNameDetailsState();
}

class _SurahNameDetailsState extends State<SurahNameDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var args =
        ModalRoute.of(context)?.settings.arguments as SurahNameDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
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
            args.name,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                provider.isDarkMode() ? MyTheme.darkColor : MyTheme.whiteColor,
          ),
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.goldColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemSurahNameDetails(
                      name: verses[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.goldColor,
                    );
                  },
                  itemCount: verses.length,
                ),
        ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}
