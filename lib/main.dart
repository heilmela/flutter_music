import 'package:flutter_music/models/track.dart';
import 'package:flutter_music/presentation/music_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Track track = Track(
    duration: 2.45,
    cover:
        'https://images.pexels.com/photos/4883870/pexels-photo-4883870.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=2000',
    playbackTime: 1.3,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Music',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.extraLightBackgroundGray,
        textTheme: new CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
          textStyle: TextStyle(
            color: CupertinoColors.white,
            fontFamily: 'SanFrancisco',
            fontSize: 18 * MediaQuery.textScaleFactorOf(context),
          ),
        ),
      ),
      home: MusicPlayer(track),
    );
  }
}
