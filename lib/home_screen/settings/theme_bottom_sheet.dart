import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.dark);
            },
            child: provider.appMode == ThemeMode.dark
                ? getSelectedTheme(AppLocalizations.of(context)!.dark)
                : getUnSelectedTheme(AppLocalizations.of(context)!.dark),
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.light);
            },
            child: provider.appMode == ThemeMode.light
                ? getSelectedTheme(AppLocalizations.of(context)!.light)
                : getUnSelectedTheme(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedTheme(String text) {
    var provider = Provider.of<AppProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: provider.isDarkMode()
                  ? MyTheme.darkColor
                  : MyTheme.goldColor),
        ),
        Icon(
          Icons.check,
          size: 25,
          color: provider.isDarkMode() ? MyTheme.darkColor : MyTheme.goldColor,
        )
      ],
    );
  }

  Widget getUnSelectedTheme(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
