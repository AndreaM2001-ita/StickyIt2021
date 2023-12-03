import 'package:flutter/material.dart';
import 'package:stick_it/utils/colors.dart'; //colors of my application

import 'dart:ui' as ui; //import user interace methods from dart

class Painter extends CustomPainter {
  final List<Offset> points;
  double? canvasWidth;
  //final ui.Image image;

  //constructor
  Painter(this.points, this.canvasWidth); //, this.image);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = mobileBackgroundColor;

    if (canvasWidth != null) {
      canvas.drawRect(
        Rect.fromPoints(Offset.zero, Offset(canvasWidth!, canvasWidth!)),
        background,
      );
    }

    //if(image!=null) canvas.drawImage(image , const Offset(-1,-1), background);

    Paint paint = Paint();
    paint.color = webBackgroundColor;
    paint.strokeWidth = 2.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != const Offset(-1, -1) &&
          points[x + 1] != const Offset(-1, -1)) {
        canvas.drawLine(points[x], points[x + 1], paint);
      } else if (points[x] != const Offset(-1, -1) &&
          points[x + 1] == const Offset(-1, -1)) {
        canvas.drawPoints(ui.PointMode.points, [points[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return true;
  }
}
