import 'package:flutter_music/presentation/controls.dart';
import 'package:flutter_music/presentation/cover.dart';
import 'package:flutter_music/presentation/background.dart';
import 'package:flutter_music/models/track.dart';
import 'package:flutter_music/presentation/options_box.dart';
import 'package:flutter_music/presentation/playtime_slider.dart';
import 'package:flutter_music/presentation/title_box.dart';
import 'package:flutter_music/presentation/volume_slider.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  Track track;
  MusicPlayer(this.track);

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
            child: SafeArea(
              child: LimitedBox(
                maxWidth: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      LimitedBox(
                        maxHeight: height * 0.35,
                        child: Cover(track),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TitleBox(),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      PlaytimeSlider(track),
                      SizedBox(
                        height: height * 0.065,
                      ),
                      Controls(),
                      SizedBox(
                        height: height * 0.065,
                      ),
                      Volumeslider(),
                      SizedBox(
                        height: height * 0.065,
                      ),
                      OptionsBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
