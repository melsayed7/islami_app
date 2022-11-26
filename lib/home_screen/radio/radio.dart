import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'radio-screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text(
          AppLocalizations.of(context)!.holyQuranRadio,
          style: Theme.of(context).textTheme.headline2,
        ),
        Row(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: MyTheme.goldColor,
                    size: 40,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: MyTheme.goldColor,
                    size: 40,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: MyTheme.goldColor,
                    size: 40,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
