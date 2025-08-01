const MINE = '*';

class Minesweeper {
  List<String> board;
  Minesweeper(this.board);

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
    for (int i = x - 1; i <= x + 1; i++) {
      for (int j = y - 1; j <= y + 1; j++) {
        if (i == x && j == y) continue;
        if (i >= 0 &&
            j >= 0 &&
            i < board.length &&
            j < board[0].length &&
            board[i][j] == MINE) {
          mines += 1;
        }
      }
    }
    return mines;
  }
}