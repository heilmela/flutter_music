import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  List<Color> colorList = [
    Color(0xff894FFC),
    Color(0xff00FFF2),
    Color(0xffFA7BC2),
  ];

  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: [colorList[0], colorList[1]],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
