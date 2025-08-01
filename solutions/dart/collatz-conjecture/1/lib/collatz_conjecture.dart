class CollatzConjecture {
  int steps(int number) {
    if (number < 1) throw ArgumentError('Only positive integers are allowed');
    int numberOfSteps = 0;
    int n = number;
    while (n != 1) {
      numberOfSteps += 1;
      n = n % 2 == 0 ? n ~/ 2 : 3 * n + 1;
    }
    return numberOfSteps;
  }
}