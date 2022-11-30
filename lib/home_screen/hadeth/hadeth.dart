import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_item.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'hadeth-screen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<AhadethItem> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    if (allAhadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_image.png')),
        Divider(
          color: MyTheme.goldColor,
          thickness: 4,
        ),
        Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        Divider(
          color: MyTheme.goldColor,
          thickness: 4,
        ),
        Expanded(
          child: allAhadeth.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.goldColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethItem(
                      ahadethItem: allAhadeth[index],
                    );
                  },
                  itemCount: allAhadeth.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.goldColor,
                    );
                  },
                ),
        )
      ],
    );
  }

  void loadAhadethFile() async {
    String allAhadethItems =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadethContent = allAhadethItems.split('#\r\n');
    for (int i = 0; i < allAhadethContent.length; i++) {
      List<String> ahadethContent = allAhadethContent[i].split('\n');
      String title = ahadethContent[0];
      ahadethContent.removeAt(0);
      AhadethItem ahadethItem =
          AhadethItem(title: title, content: ahadethContent);
      allAhadeth.add(ahadethItem);
    }
    setState(() {});
  }
}

class AhadethItem {
  String title;

  List<String> content;

  AhadethItem({required this.title, required this.content});
}
