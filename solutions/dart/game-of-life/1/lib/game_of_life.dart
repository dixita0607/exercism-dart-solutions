class GameOfLife {
  List<List<int>> state;
  GameOfLife(this.state);

  int get rows => this.state.length;
  int get cols => this.state[0].length;

  int _getAliveNeighbours(int rowPos, int colPos) {
    int aliveNeighbours = 0;
    if (colPos - 1 >= 0 && this.state[rowPos][colPos - 1] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos - 1 >= 0 &&
        colPos - 1 >= 0 &&
        this.state[rowPos - 1][colPos - 1] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos - 1 >= 0 && this.state[rowPos - 1][colPos] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos - 1 >= 0 &&
        colPos + 1 < cols &&
        this.state[rowPos - 1][colPos + 1] == 1) {
      aliveNeighbours += 1;
    }
    if (colPos + 1 < cols && this.state[rowPos][colPos + 1] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos + 1 < rows &&
        colPos + 1 < cols &&
        this.state[rowPos + 1][colPos + 1] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos + 1 < rows && this.state[rowPos + 1][colPos] == 1) {
      aliveNeighbours += 1;
    }
    if (rowPos + 1 < rows &&
        colPos - 1 >= 0 &&
        this.state[rowPos + 1][colPos - 1] == 1) {
      aliveNeighbours += 1;
    }
    return aliveNeighbours;
  }

  void tick() {
    this.state = List.generate(
      rows,
      (row) => List.generate(cols, (col) {
        int cell = this.state[row][col];
        int aliveNeighbours = _getAliveNeighbours(row, col);
        if (cell == 1) {
          return aliveNeighbours == 2 || aliveNeighbours == 3 ? 1 : 0;
        } else {
          return aliveNeighbours == 3 ? 1 : 0;
        }
      }),
    );
  }

  List<List<int>> matrix() => this.state;
}