import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HadethItemContantDetails extends StatelessWidget {
  String content;

  HadethItemContantDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        content,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.blackColor),
      ),
    );
  }
}
