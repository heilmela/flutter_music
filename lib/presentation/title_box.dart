import 'package:flutter_music/presentation/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_svg/svg.dart';

class TitleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontScale = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Miles Davis',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text('So What',
                  style: CupertinoTheme.of(context).textTheme.textStyle),
            ],
          ),
          Button(
            baseSize: 24 * fontScale,
            asset: SvgPicture.asset(
              'assets/icons/ellipsis-horizontal.svg',
              color: Colors.white,
            ),
            onPressed: () {
              print('Settings');
            },
            fillColor: Colors.white10,
          )
        ],
      ),
    );
  }
}
