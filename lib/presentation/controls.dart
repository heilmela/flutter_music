import 'package:flutter_music/presentation/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Controls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontScale = MediaQuery.textScaleFactorOf(context);
    final double baseSize = 50;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            baseSize: baseSize,
            asset: SvgPicture.asset(
              'assets/icons/play-back.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Play');
            },
          ),
          SizedBox(
            width: baseSize,
          ),
          Button(
            baseSize: baseSize * 1.3,
            asset: SvgPicture.asset(
              'assets/icons/play.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Play');
            },
          ),
          SizedBox(
            width: baseSize,
          ),
          Button(
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
