import 'package:flutter/material.dart';
import 'package:jelly/src/model/border_point.dart';

import 'jelly_configurations.dart';

class JellyPaint extends CustomPainter {
  JellyPaint({@required this.animation, @required this.jellyConfigurations})
      : super(repaint: animation);

  /// Animation representing what we are painting
  final Animation<double> animation;
  List<JellyConfiguration> jellyConfigurations = List();

  Offset getOffset(BorderPoint borderPoint) {
    return Offset(borderPoint.dx, borderPoint.dy);
  }

  void paintJelly(Canvas canvas, Size size) {
    if (jellyConfigurations == null || jellyConfigurations.isEmpty) {
      return;
    }

    for (int j = 0; j < jellyConfigurations.length; j++) {
      JellyConfiguration configuration = jellyConfigurations[j];
      configuration.updateJellyPathPoints(animation.value, j);

      // center of our widget
      if (configuration.keepNodes) {
        // center point of view.
        canvas.drawCircle(configuration.centerPointOfJelly,
            configuration.nodeRadius, configuration.nodePaint);

        // node points of view.
        for (int i = 0; i < configuration.borderPoints.length; i++) {
          canvas.drawCircle(getOffset(configuration.borderPoints[i]),
              configuration.nodeRadius, configuration.nodePaint);
        }
      }
      // and same path, we are creating using Bazier curve.
      canvas.drawPath(configuration.jellyPath, configuration.fillPaint);
    }
    canvas.save();
    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintJelly(canvas, size);
  }

  @override
  bool shouldRepaint(JellyPaint other) {
    return animation.value != other.animation.value;
  }
}
