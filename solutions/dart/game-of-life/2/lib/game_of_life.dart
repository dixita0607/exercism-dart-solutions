class GameOfLife {
  List<List<int>> _state;
  GameOfLife(this._state);

  int get rows => _state.length;
  int get cols => _state[0].length;

  List<List<int>> matrix() => _state;

  void tick() {
    _state = List.generate(
      rows,
      (row) => List.generate(cols, (col) {
        int aliveNeighbours = _getAliveNeighbours(row, col);
        if (_state[row][col] == 1) {
          return aliveNeighbours == 2 || aliveNeighbours == 3 ? 1 : 0;
        } else {
          return aliveNeighbours == 3 ? 1 : 0;
        }
      }),
    );
  }

  int _getAliveNeighbours(int rowPos, int colPos) {
    int aliveNeighbours = 0;
    for (int i = rowPos - 1; i <= rowPos + 1; i++) {
      for (int j = colPos - 1; j <= colPos + 1; j++) {
        if (i == rowPos && j == colPos) continue;
        if (i >= 0 && j >= 0 && i < rows && j < cols) {
          aliveNeighbours += _state[i][j];
        }
      }
    }

    return aliveNeighbours;
  }
}