import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Widget asset;
  final Function onPressed;
  final Color fillColor;
  final double baseSize;
  Button({this.asset, this.onPressed, this.fillColor, this.baseSize = 30});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color backgroundColor;
  double basePadding = 5;
  double width;
  double height;
  @override
  void initState() {
    super.initState();
    setState(() {
      backgroundColor = this.widget.fillColor;
      width = this.widget.baseSize;
      height = this.widget.baseSize;
    });
  }

  void release() {
    setState(() {
      backgroundColor = this.widget.fillColor;
      width = this.widget.baseSize;
      height = this.widget.baseSize;
      basePadding = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          if (this.widget.fillColor != null) {
            backgroundColor = Colors.white24;
          } else {
            backgroundColor = Colors.white12;
          }
          width = this.widget.baseSize * 0.87;
          height = this.widget.baseSize * 0.87;
          basePadding += this.widget.baseSize * 0.13;
        });
      },
      onTapCancel: release,
      onTapUp: (_) => release(),
      child: SizedBox(
        width: this.widget.baseSize,
        height: this.widget.baseSize,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: backgroundColor,
          ),
          padding: EdgeInsets.all(basePadding),
          child: this.widget.asset,
        ),
      ),
    );
  }
}
