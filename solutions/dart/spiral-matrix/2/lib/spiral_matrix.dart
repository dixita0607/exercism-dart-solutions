import 'dart:math';

enum Direction { right, down, left, up }

class SpiralMatrix {
  final int size;
  SpiralMatrix(this.size);

  List<List<int>> toList() {
    List<List<int>> matrix =
        List.generate(size, (_) => List.generate(size, (_) => 0));

    ({int row, int col}) cursor = (row: 0, col: 0);
    Direction direction = Direction.right;
    int index = 1;
    while (index <= (size * size)) {
      matrix[cursor.row][cursor.col] = index;

      if (index == (size * size)) break;

      final next = _nextCursor(cursor.row, cursor.col, direction);
      index++;
      direction =
          _isCorner(next.row, next.col) || matrix[next.row][next.col] != 0
              ? Direction.values[(direction.index + 1) % 4]
              : direction;
      cursor = matrix[next.row][next.col] != 0
          ? _nextCursor(cursor.row, cursor.col, direction)
          : next;
    }
    return matrix;
  }

  ({int row, int col}) _nextCursor(int row, int col, Direction direction) {
    return switch (direction) {
      Direction.right => (row: row, col: min(col + 1, size)),
      Direction.down => (row: min(row + 1, size), col: col),
      Direction.left => (row: row, col: max(col - 1, 0)),
      Direction.up => (row: max(row - 1, 0), col: col),
    };
  }

  bool _isCorner(int x, int y) =>
      (x, y) == (0, 0) ||
      (x, y) == (0, size - 1) ||
      (x, y) == (size - 1, 0) ||
      (x, y) == (size - 1, size - 1);
}
