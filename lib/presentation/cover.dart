import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/track.dart';

class Cover extends StatefulWidget {
  final Track track;
  final bool playing;
  Cover(this.track, this.playing);

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  double start = 0.7;
  double peak = 1.0;
  double end = 0.9;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: start, end: peak)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 90.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: peak, end: end)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 10.0,
        ),
      ],
    ).animate(_controller);
    // _controller.addListener(() {
    //   setState(() {});
    // });
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    if (mounted && this.widget.playing && !_controller.isCompleted) {
      _controller.forward();
    } else if (mounted && !this.widget.playing && _controller.isCompleted) {
      _controller.reverse();
    }

    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        //In order to keep the quadratic shape we use the minimal biggest constraint to fill the parent
        double size =
            math.min(constraints.biggest.width, constraints.biggest.height);

        return Container(
          width: size * _animation.value,
          height: size * _animation.value,
          child: Card(
            elevation: this.widget.playing ? 20 : 7,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              widget.track.cover,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
