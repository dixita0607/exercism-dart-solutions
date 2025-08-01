import 'dart:math' show pow;

class DifferenceOfSquares {
  num squareOfSum(int n) => pow((n * (n + 1)) / 2, 2);

  num sumOfSquares(int n) => (n * (n + 1) * (2 * n + 1)) / 6;

  num differenceOfSquares(int number) =>
      (squareOfSum(number) - sumOfSquares(number));
}