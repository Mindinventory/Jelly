import 'dart:ui';

import 'package:jelly/src/model/border_point.dart';


class JellyBody {
  List<BorderPoint> borderPoints;
  Path jellyPath;

  JellyBody(this.borderPoints, this.jellyPath);
}
