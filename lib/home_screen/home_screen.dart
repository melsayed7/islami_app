import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth.dart';
import 'package:islami_app/home_screen/quran/quran.dart';
import 'package:islami_app/home_screen/radio/radio.dart';
import 'package:islami_app/home_screen/sebah/sebah.dart';
import 'package:islami_app/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screen = [
    QuranScreen(),
    HadethScreen(),
    SebahScreen(),
    RadioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_image.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyTheme.goldColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/quran.png'),
                    ),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/hadeth.png'),
                    ),
                    label: 'Elhadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/sebha.png'),
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/radio.png'),
                    ),
                    label: 'Radio'),
              ],
            ),
          ),
          body: screen[currentIndex],
        ),
      ],
    );
  }
}
