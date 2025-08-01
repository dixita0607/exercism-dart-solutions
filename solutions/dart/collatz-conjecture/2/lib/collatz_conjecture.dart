// Inspired to use recursion after learning from some community solutions.

class CollatzConjecture {
  int steps(int n) {
    if (n < 1) throw ArgumentError('Only positive integers are allowed');
    if (n == 1) return 0;
    return 1 + (n = n % 2 == 0 ? steps(n ~/ 2) : steps(3 * n + 1));
  }
}