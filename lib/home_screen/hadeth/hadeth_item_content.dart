import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/appProvider.dart';
import 'hadeth.dart';
import 'hadeth_item_contant_details.dart';

class HadethItemContent extends StatelessWidget {
  static const String routeName = 'HadethItemContent';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as AhadethItem;
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
              args.title,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: provider.isDarkMode()
                    ? MyTheme.darkColor
                    : MyTheme.whiteColor),
            child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return HadethItemContantDetails(content: args.content[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
