// Implemented [Harron's method](https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Heron's_method) after watching some community solutions.
 
class SquareRoot {
  int squareRoot(int square) {
    if (square == 1) return 1;
    int i = square ~/ 2;
    while (square != (i * i)) {
      i = (i + square ~/ i) ~/ 2;
    }
    return i;
  }
}