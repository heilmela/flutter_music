import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvertButton extends StatefulWidget {
  final IconData filled;
  final IconData outline;
  final Function onPressed;
  final double size;
  double sizeAdjust;
  InvertButton(
      {this.filled,
      this.outline,
      this.size,
      this.onPressed,
      this.sizeAdjust = 0.18});

  @override
  _InvertButtonState createState() => _InvertButtonState();
}

class _InvertButtonState extends State<InvertButton> {
  bool active;
  @override
  void initState() {
    super.initState();
    setState(() {
      active = false;
    });
  }

  Widget iconBuilder() {
    if (active) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ShaderMask(
          blendMode: BlendMode.srcOut,
          shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white],
              tileMode: TileMode.mirror,
              stops: [0.0]).createShader(bounds),
          child: Container(
            width: this.widget.size * 1.3,
            height: this.widget.size * 1.3,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Icon(
              this.widget.filled,
              size: this.widget.size,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: this.widget.size * 1.3,
        height: this.widget.size * 1.3,
        child: Center(
          child: Icon(
            this.widget.outline,
            size: this.widget.size * (1 + this.widget.sizeAdjust),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.active = !this.active;
        });
        this.widget.onPressed();
      },
      child: iconBuilder(),
    );
  }
}
