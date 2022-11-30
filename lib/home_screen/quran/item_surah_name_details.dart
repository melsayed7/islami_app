import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class ItemSurahNameDetails extends StatelessWidget {
  String name;
  int index;

  ItemSurahNameDetails({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Text(
      '$name(${index + 1})',
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 24,
        color: provider.isDarkMode() ? MyTheme.yellowColor : MyTheme.blackColor,
      ),
    );
  }
}
