import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/home_screen/radio/RadioResponse.dart';
import 'package:islami_app/home_screen/radio/radio_item.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/provider/appProvider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = 'radio-screen';

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  var audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset('assets/images/radio_image.png'),
        ),
        Expanded(
          child: FutureBuilder(
            future: getRadio(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var radioList = snapshot.data?.radios ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: radioList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: screenSize.width,
                      child: RadioItem(
                        radios: radioList[index],
                        audioPlayer: audioPlayer,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.goldColor,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<RadioResponse> getRadio() async {
    var url = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } else {
      throw Exception('failed to load radios');
    }
  }
}
