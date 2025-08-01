import 'dart:math' show sqrt;

class NthPrime {
  bool isPrime(int number) {
    if (number < 2) return false;
    if (number == 2) return true;
    int p = 2;
    while (p <= sqrt(number)) {
      if (number % p == 0) return false;
      p = p + 1;
    }
    return true;
  }

  int prime(int nth) {
    if (nth == 0) {
      throw ArgumentError('There is no zeroth prime');
    }
    if (nth == 1) return 2;
    int currentPrimeIndex = 1;
    int number = 2;
    while (currentPrimeIndex != nth) {
      number += 1;
      if (isPrime(number)) currentPrimeIndex += 1;
    }
    return number;
  }
}