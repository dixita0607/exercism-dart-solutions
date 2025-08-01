import 'dart:math';

class AllYourBase {
  List<int> rebase(int base, List<int> digits, int newBase) =>
      BasedNumbers(digits, base).rebase(newBase).digits;
}

class BasedNumbers {
  final List<int> digits;
  final int base;
  BasedNumbers(this.digits, this.base) {
    if (base < 2) throw ArgumentError('Base can not be less than 2');
    if (digits.any((d) => d < 0))
      throw ArgumentError('Non negative digits are not allowed');
    if (digits.any((d) => d >= base))
      throw ArgumentError('Invalid digits provided for the given base');
  }

  BasedNumbers rebase(int newBase) => parse(toDecimal(), newBase);

  int toDecimal() {
    return digits.reversed.indexed.fold(0, (folded, indexed) {
      final (index, digit) = indexed;
      return folded + (pow(base, index) * digit as int);
    });
  }

  static BasedNumbers parse(int decimal, int base) {
    if (decimal == 0) return BasedNumbers([0], base);
    final parsed = BasedNumbers([], base);
    int n = decimal;
    while (n > 0) {
      parsed.digits.insert(0, n % base);
      n = n ~/ base;
    }
    return parsed;
  }
}
