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
    return Stack(children: [
      Image.asset(
        'assets/images/background_image.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
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
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: const Color(0xffB7935F),
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
                  angle += 12;
                  increaseCounter();
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffB7935F)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              child: Text(tasbeehat[index],
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: MyTheme.whiteColor, fontSize: 27)),
            ),
          ],
        ),
      )
    ]);
  }

  increaseCounter() {
    if (counter < 32) {
      counter++;
    } else {
      counter = 0;
      increaseTasbehat();
    }
  }

  increaseTasbehat() {
    if (index < 5) {
      index++;
    }
    if (index == 5) {
      index = 0;
    }
  }
}
