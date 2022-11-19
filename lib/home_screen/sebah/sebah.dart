import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

class SebahScreen extends StatelessWidget {
  static const String routeName = 'sebah-screen';

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
            Padding(
              padding: const EdgeInsets.all(40),
              child:
                  Center(child: Image.asset('assets/images/sebah_image.png')),
            ),
            Text(
              'عدد التسبيحات',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xffB7935F),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  '30',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 22),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffB7935F),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'سبحان الله',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 22, color: MyTheme.whiteColor),
                )),
          ],
        ),
      )
    ]);
  }
}
