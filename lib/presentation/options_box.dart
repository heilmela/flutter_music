import 'package:flutter_music/presentation/buttons.dart/glyph_button.dart';
import 'package:flutter_music/presentation/buttons.dart/invert_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontScale = MediaQuery.textScaleFactorOf(context);
    final double baseSize =
        CupertinoTheme.of(context).textTheme.textStyle.fontSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InvertButton(
            size: baseSize,
            filled: CupertinoIcons.quote_bubble_fill,
            outline: CupertinoIcons.quote_bubble,
            onPressed: () {
              print('Lyrics');
            },
          ),
          SizedBox(
            width: baseSize * 4,
          ),
          GlyphButton(
            baseSize: baseSize * 1.3,
            asset: SvgPicture.asset(
              'assets/icons/airplay.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Play');
            },
          ),
          SizedBox(
            width: baseSize * 4,
          ),
          InvertButton(
            size: baseSize,
            filled: CupertinoIcons.list_bullet,
            outline: CupertinoIcons.list_bullet,
            onPressed: () {
              print('Playlist');
            },
          ),
        ],
      ),
    );
  }
}
