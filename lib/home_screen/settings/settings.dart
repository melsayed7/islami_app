import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/settings/language_bottom_sheet.dart';
import 'package:islami_app/home_screen/settings/theme_bottom_sheet.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: () {
                showBottomSheetLanguage(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            AppLocalizations.of(context)!.theming,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: () {
                showBottomSheetTheming(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appMode == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return LanguageBottomSheet();
        });
  }

  void showBottomSheetTheming(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
