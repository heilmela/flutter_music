import 'package:flutter_music/presentation/controls.dart';
import 'package:flutter_music/presentation/cover.dart';
import 'package:flutter_music/presentation/background.dart';
import 'package:flutter_music/models/track.dart';
import 'package:flutter_music/presentation/options_box.dart';
import 'package:flutter_music/presentation/playtime_slider.dart';
import 'package:flutter_music/presentation/title_box.dart';
import 'package:flutter_music/presentation/volume_slider.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final Track track;
  MusicPlayer(this.track);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool playing = false;

  void play() {
    setState(() {
      playing = !playing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Positioned(
            top: 0,
            left: 0,
            width: width,
            height: height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Container(
                    width: width,
                    height: height * 0.4,
                    alignment: Alignment.center,
                    child: Cover(
                      widget.track,
                      playing,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TitleBox(),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  PlaytimeSlider(widget.track),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  Controls(play, playing),
                  SizedBox(
                    height: height * 0.055,
                  ),
                  Volumeslider(),
                  SizedBox(
                    height: height * 0.055,
                  ),
                  OptionsBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
