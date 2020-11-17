import 'package:flutter_music/models/track.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaytimeSlider extends StatefulWidget {
  Track track;

  PlaytimeSlider(this.track);

  @override
  _PlaytimeState createState() => _PlaytimeState();
}

class _PlaytimeState extends State<PlaytimeSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              disabledInactiveTrackColor: Colors.black45,
              trackShape: CustomTrackShape(),
              trackHeight: 0.5,
              disabledActiveTrackColor: Colors.white,
              disabledThumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 2.5),
            ),
            child: Slider(
              onChanged: null,
              divisions: 10,
              min: 0.0,
              max: this.widget.track.duration,
              value: this.widget.track.playbackTime,
              activeColor: Colors.white,
              inactiveColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              this
                  .widget
                  .track
                  .playbackTime
                  .toStringAsFixed(2)
                  .replaceAll('.', ':'),
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize:
                      CupertinoTheme.of(context).textTheme.textStyle.fontSize *
                          0.75,
                  color: Colors.white54),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              this
                  .widget
                  .track
                  .duration
                  .toStringAsFixed(2)
                  .replaceAll('.', ':'),
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize:
                      CupertinoTheme.of(context).textTheme.textStyle.fontSize *
                          0.75,
                  color: Colors.white54),
            ),
          )
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
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
