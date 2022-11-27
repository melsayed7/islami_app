import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_item_content.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HadethItem extends StatelessWidget {
  AhadethItem ahadethItem;

  HadethItem({required this.ahadethItem});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethItemContent.routeName,
            arguments: ahadethItem);
      },
      child: Text(
        ahadethItem.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color:
              provider.isDarkMode() ? MyTheme.whiteColor : MyTheme.blackColor,
        ),
      ),
    );
  }
}
