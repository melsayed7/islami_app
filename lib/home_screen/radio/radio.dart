import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'radio-screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text(
          AppLocalizations.of(context)!.holyQuranRadio,
          style: provider.isDarkMode()
              ? Theme.of(context).primaryTextTheme.headline1
              : Theme.of(context).primaryTextTheme.headline1,
        ),
        Row(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.goldColor,
                    size: 40,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.goldColor,
                    size: 40,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.goldColor,
                    size: 40,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
