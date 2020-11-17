import 'package:flutter/material.dart';

import '../models/track.dart';

class Cover extends StatelessWidget {
  Track track;
  Cover(this.track);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          track.cover,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
