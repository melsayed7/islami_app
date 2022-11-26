import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage(
                  'en' /*AppLocalizations.of(context)!.english*/);
            },
            child: provider.appLanguage == 'en'
                ? getSelectedLanguage(AppLocalizations.of(context)!.english)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage(
                  'ar' /*AppLocalizations.of(context)!.arabic*/);
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedLanguage(AppLocalizations.of(context)!.arabic)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(fontSize: 18, color: MyTheme.goldColor),
        ),
        Icon(
          Icons.check,
          size: 25,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedLanguage(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 18),
    );
  }
}
