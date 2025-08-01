BigInt square(final int n) {
  if (n < 1 || n > 64) {
    throw ArgumentError('square must be between 1 and 64');
  } else {
    return BigInt.from(2).pow(n - 1);
  }
}
BigInt total() => BigInt.from(2).pow(64) - BigInt.from(1);