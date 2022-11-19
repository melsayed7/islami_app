import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

class HadethScreen extends StatelessWidget {
  static const String routeName = 'hadeth-screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_image.png')),
        Divider(
          color: MyTheme.goldColor,
          thickness: 4,
        ),
        Text(
          'Alahadith',
          style: Theme.of(context).textTheme.headline2,
        ),
        Divider(
          color: MyTheme.goldColor,
          thickness: 4,
        ),
      ],
    );
  }
}
