import 'package:flutter_music/presentation/buttons.dart/glyph_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Controls extends StatelessWidget {
  final Function play;
  final bool playing;
  Controls(this.play, this.playing);

  GlyphButton playButtonBuilder(double baseSize) {
    if (!playing) {
      return GlyphButton.contract(
        baseSize: baseSize * 1.35,
        padding: 0.1,
        asset: SvgPicture.asset(
          'assets/icons/play.svg',
          color: Colors.white,
        ),
        onPressed: () {
          play();
          print('Play');
        },
      );
    } else {
      return GlyphButton.contract(
        baseSize: baseSize * 1.35,
        padding: 0.1,
        asset: SvgPicture.asset(
          'assets/icons/pause.svg',
          color: Colors.white,
        ),
        onPressed: () {
          play();
          print('Play');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontScale = MediaQuery.textScaleFactorOf(context);
    final double baseSize = 50;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlyphButton.contract(
            baseSize: baseSize,
            asset: SvgPicture.asset(
              'assets/icons/play-back.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Play back!');
            },
          ),
          SizedBox(
            width: baseSize,
          ),
          playButtonBuilder(baseSize),
          SizedBox(
            width: baseSize,
          ),
          GlyphButton.contract(
            baseSize: baseSize,
            asset: SvgPicture.asset(
              'assets/icons/play-forward.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Play');
            },
          ),
        ],
      ),
    );
  }
}
