import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlyphButton extends StatefulWidget {
  final Widget asset;
  final Function onPressed;
  final Color backgroundColor;
  final double baseSize;
  final bool contract;
  final double contractStrength;
  final double padding;
  GlyphButton({
    this.asset,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.baseSize = 30,
    this.padding = 0.25,
  })  : assert(padding < 1),
        assert(0 < padding),
        this.contract = false,
        this.contractStrength = 0;

  GlyphButton.contract({
    this.asset,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.baseSize = 30,
    this.padding = 0.25,
    this.contractStrength = 0.1,
  })  : assert(contractStrength < 1),
        assert(0 < contractStrength),
        assert(padding < 1),
        assert(0 < padding),
        this.contract = true;

  @override
  _GlyphButtonState createState() => _GlyphButtonState();
}

class _GlyphButtonState extends State<GlyphButton> {
  Color backgroundColor;
  double initialSize;
  double width;
  double height;
  List<Function> tapEffects = [];
  List<Function> releaseEffects = [];

  void addBackground() {
    if (this.widget.backgroundColor != Colors.transparent) {
      backgroundColor = Colors.white24;
    } else {
      backgroundColor = Colors.white12;
    }
  }

  void resetBackground() {
    backgroundColor = this.widget.backgroundColor;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      backgroundColor = this.widget.backgroundColor;
      initialSize = this.widget.baseSize * (1 - this.widget.padding);
      width = initialSize;
      height = initialSize;
      tapEffects.add(this.addBackground);
      releaseEffects.add(this.resetBackground);
      if (this.widget.contract) {
        tapEffects.add(contract);
        releaseEffects.add(expand);
      }
    });
  }

  void contract() {
    width = initialSize * (1 - this.widget.contractStrength);
    height = initialSize * (1 - this.widget.contractStrength);
  }

  void expand() {
    width = initialSize;
    height = initialSize;
  }

  void release() {
    setState(() {
      this.releaseEffects.forEach((releaseEffect) => releaseEffect());
    });
  }

  void tap() {
    setState(() {
      this.tapEffects.forEach((tapEffect) => tapEffect());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => tap(),
      onTapCancel: release,
      onTapUp: (_) => release(),
      child: Container(
        width: this.widget.baseSize,
        height: this.widget.baseSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.linearToEaseOut,
            width: width,
            height: height,
            child: this.widget.asset,
          ),
        ),
      ),
    );
  }
}
