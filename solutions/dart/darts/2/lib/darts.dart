import 'dart:math' show Point;

class Darts {
  int score(double x, double y) => switch (Point(
    x,
    y,
  ).distanceTo(Point(0, 0))) {
    > 10 => 0,
    <= 10 && > 5 => 1,
    <= 5 && > 1 => 5,
    _ => 10,
  };
}