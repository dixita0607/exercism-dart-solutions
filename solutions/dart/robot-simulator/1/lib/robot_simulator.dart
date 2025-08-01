import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Position position;
  Orientation orientation;

  Robot(this.position, this.orientation);

  void move(String directions) {
    for (int i = 0; i < directions.length; i++) {
      final direction = directions[i];
      switch (direction) {
        case 'R':
        case 'L':
          _turnTo(direction);
        case 'A':
          _stepInto();
        case _:
          throw ArgumentError('Invalid instruction');
      }
    }
  }

  void _turnTo(String direction) {
    orientation = Orientation
        .values[(orientation.index + (direction == 'R' ? 1 : 3)) % 4];
  }

  void _stepInto() {
    switch (orientation) {
      case Orientation.north:
        position.y += 1;
      case Orientation.east:
        position.x += 1;
      case Orientation.south:
        position.y -= 1;
      case Orientation.west:
        position.x -= 1;
    }
  }
}

