import 'dart:math';

class PrimeFactors {
  List<int> factors(int number) =>
      _listFactors(number).where((n) => _isPrime(n)).toList();

  static List<int> _listFactors(int n) {
    List<int> factors = [];
    int dividor = 2;
    while (n != 1) {
      if (n % dividor == 0) {
        factors.add(dividor);
        n = n ~/ dividor;
      } else {
        dividor += 1;
      }
    }
    return factors;
  }

  static bool _isPrime(int n) {
    if (n == 1) return false;
    if (n == 2) return true;
    int dividor = 2;
    while (dividor <= sqrt(n)) {
      if (n % dividor == 0) return false;
      dividor += 1;
    }
    return true;
  }
}
