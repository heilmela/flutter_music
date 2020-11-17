import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconSwitchButton extends StatefulWidget {
  final IconData filled;
  final IconData outline;
  final Function onPressed;
  final double size;
  IconSwitchButton({this.filled, this.outline, this.size, this.onPressed});

  @override
  _IconSwitchButtonState createState() => _IconSwitchButtonState();
}

class _IconSwitchButtonState extends State<IconSwitchButton> {
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
        borderRadius: BorderRadius.circular(8),
        child: ShaderMask(
          blendMode: BlendMode.srcOut,
          shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white],
              tileMode: TileMode.mirror,
              stops: [0.0]).createShader(bounds),
          child: Container(
            width: this.widget.size * 1.5,
            height: this.widget.size * 1.5,
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
        padding: EdgeInsets.all(2),
        child: Icon(
          this.widget.outline,
          size: this.widget.size,
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
