import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

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
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 80),
                child: Image.asset('assets/images/head_of_seb7a.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 120),
                alignment: AlignmentDirectional.topCenter,
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/body_of_seb7a.png'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Number of Praises',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 22,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                //141A2E
                //B7935F
                color: const Color(0xff141A2E),
                borderRadius: BorderRadius.circular(20)),
            child: Text('$counter',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 25)),
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
                backgroundColor:
                    //Color(0xffB7935F)
                    //Color(0xffFACC1D)
                    MaterialStateProperty.all(const Color(0xffFACC1D)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ))),
            child: Text(tasbeehat[index],
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: MyTheme.blackColor, fontSize: 27)),
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
