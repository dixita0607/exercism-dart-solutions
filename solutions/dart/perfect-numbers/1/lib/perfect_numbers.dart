import 'dart:math' show sqrt;

enum Classification { perfect, abundant, deficient }

class PerfectNumbers {
  Classification classify(int number) {
    if (number <= 0) throw ArgumentError('Number should be positive integer');
    int sumOfFactors = number.factors.sum();
    print(number.factors);
    if (sumOfFactors > number) {
      return Classification.abundant;
    }
    if (sumOfFactors < number) {
      return Classification.deficient;
    }
    return Classification.perfect;
  }
}

extension Factors on int {
  List<int> get factors {
    List<int> factors = [];
    for (int i = 1; i < sqrt(this); i++) {
      if (this % i == 0 && i != this) {
        factors.add(i);
        // Also add co factors
        int quotient = this ~/ i;
        if (quotient != this && i != quotient) {
          factors.add(this ~/ i);
        }
      }
    }
    return factors;
  }
}

extension Sum on List<int> {
  int sum() => this.fold(0, (total, number) => total + number);
}