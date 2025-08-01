import 'dart:math';

const MINE = '*';

class Minesweeper {
  final List<String> board;
  Minesweeper(this.board);

  late final rows = board.length;
  late final cols = board[0].length;

  List<String> get annotated => board.isEmpty
      ? board
      : board.indexed.map((row) {
          final (rowIndex, rowValue) = row;
          return rowValue.split('').indexed.map((cell) {
            final (cellIndex, cellValue) = cell;
            if (cellValue == MINE) return cellValue;
            final mines = _adjecentMines(rowIndex, cellIndex);
            return mines > 0 ? mines : cellValue;
          }).join('');
        }).toList();

  int _adjecentMines(int x, int y) {
    int mines = 0;
    for (int i = max(x - 1, 0); i <= min(x + 1, rows - 1); i++) {
      for (int j = max(y - 1, 0); j <= min(y + 1, cols - 1); j++) {
        if (i == x && j == y) continue;
        if (board[i][j] == MINE) {
          mines += 1;
        }
      }
    }
    return mines;
  }
}
