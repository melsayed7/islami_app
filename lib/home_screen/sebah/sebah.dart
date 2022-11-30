import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class SebahScreen extends StatefulWidget {
  static const String routeName = 'sebah-screen';

  @override
  State<SebahScreen> createState() => _SebahScreenState();
}

class _SebahScreenState extends State<SebahScreen> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> tasbeehat = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اکبر",
    "لا حول وقوة الا بالله"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 80),
                child: Image.asset('assets/images/head_of_seb7a.png',
                    color: provider.isDarkMode() ? MyTheme.yellowColor : null),
              ),
              Container(
                padding: const EdgeInsets.only(top: 120),
                alignment: AlignmentDirectional.topCenter,
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    'assets/images/body_of_seb7a.png',
                    color: provider.isDarkMode() ? MyTheme.yellowColor : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.numberOfPraises,
            style: provider.isDarkMode()
                ? Theme.of(context).primaryTextTheme.headline1
                : Theme.of(context).primaryTextTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? const Color(0xff141A2E)
                    : const Color(0xffB7935F),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '$counter',
              style: provider.isDarkMode()
                  ? Theme.of(context).primaryTextTheme.headline1
                  : Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                increaseCounter();
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(provider.isDarkMode()
                    ? const Color(0xffFACC1D)
                    : const Color(0xffB7935F)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ))),
            child: Text(
              tasbeehat[index],
              style: provider.isDarkMode()
                  ? Theme.of(context).primaryTextTheme.subtitle2
                  : Theme.of(context).primaryTextTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  increaseCounter() {
    counter++;
    if (counter % 33 == 0) {
      if (index == tasbeehat.length - 1) {
        index = -1;
      }
      index++;
    }
    setState(() {
      angle += 20;
    });
  }
}
