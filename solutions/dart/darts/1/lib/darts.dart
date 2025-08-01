import 'dart:math' show sqrt, pow;

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x;
  double y;
  Point(this.x, this.y);
  Point.origin() : x = xOrigin, y = yOrigin;

  double distance(Point p) => sqrt(pow(p.x - this.x, 2) + pow(p.y - this.y, 2));
}

class Darts {
  int score(double x, double y) => switch (Point(
    x,
    y,
  ).distance(Point.origin())) {
    > 10 => 0,
    <= 10 && > 5 => 1,
    <= 5 && > 1 => 5,
    _ => 10,
  };
}