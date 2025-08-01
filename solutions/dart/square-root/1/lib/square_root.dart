class SquareRoot {
  int squareRoot(int square) {
    if (square == 1) return 1;
    int i = square ~/ 2;
    while (square - (i * i) != 0) {
      if (square < (i * i)) {
        i = i ~/ 2;
      } else if (square > (i * i)) {
        i = i + 1;
      }
    }
    return i;
  }
}