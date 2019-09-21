class BorderPoint {
  double dx;
  double dy;
  double radianAngle;
  double radius;
  MovementDirection direction;

  BorderPoint(this.dx, this.dy, this.radianAngle, this.radius, this.direction);
}

enum MovementDirection {INWARD, OUTWARD}