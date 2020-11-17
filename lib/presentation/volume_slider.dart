import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Volumeslider extends StatefulWidget {
  @override
  _PlaytimeState createState() => _PlaytimeState();
}

class _PlaytimeState extends State<Volumeslider> {
  double volume = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.volume_down,
            size: CupertinoTheme.of(context).textTheme.textStyle.fontSize,
            color: Colors.white70,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                disabledInactiveTrackColor: Colors.black45,
                trackShape: CustomTrackShape(),
                trackHeight: 0.5,
                disabledActiveTrackColor: Colors.white,
                disabledThumbColor: Colors.white,
                overlayColor: Colors.transparent,
                overlayShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.5),
              ),
              child: Slider(
                onChanged: (value) {
                  setState(() {
                    volume = value;
                  });
                },
                min: 0.0,
                max: 100,
                value: volume,
                activeColor: Colors.white,
                inactiveColor: Colors.white,
              ),
            ),
          ),
          Icon(
            CupertinoIcons.volume_down,
            size: CupertinoTheme.of(context).textTheme.textStyle.fontSize,
            color: Colors.white70,
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx + 20;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 40;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
