import 'dart:math';

class LargestSeriesProduct {
  int largestProduct(String sequence, int span) {
    if (sequence.contains(RegExp(r'[^\d]')))
      throw ArgumentError('digits input must only contain digits');
    if (span < 0) throw ArgumentError('span must not be negative');
    if (span > sequence.length)
      throw ArgumentError('span must be smaller than string length');
    if (span == 0) return 1;
    if (BigInt.parse(sequence) == BigInt.from(0)) return 0;
    int product = 0;
    for (int i = 0; i <= sequence.length - span; i++) {
      product = max(
          product,
          sequence
              .substring(i, i + span)
              .split('')
              .fold<int>(1, (mul, str) => mul * int.parse(str)));
    }
    return product;
  }
}
