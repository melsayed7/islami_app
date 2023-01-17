import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/radio/RadioResponse.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  Radios radios;
  AudioPlayer audioPlayer;

  RadioItem({required this.radios, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Text(
          widget.radios.name ?? '',
          style: provider.isDarkMode()
              ? Theme.of(context).primaryTextTheme.headline1
              : Theme.of(context).primaryTextTheme.headline1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (widget.radios.url != null) {
                  await widget.audioPlayer.play(UrlSource(widget.radios.url!));
                }
              },
              icon: Icon(
                Icons.play_circle_fill_sharp,
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : MyTheme.goldColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () async {
                await widget.audioPlayer.pause();
              },
              icon: Icon(
                Icons.pause_circle_sharp,
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : MyTheme.goldColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
