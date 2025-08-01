class Luhn {
  bool valid(String number) {
    String trimmed = number.replaceAll(RegExp(r'\s'), '');
    if (trimmed.length <= 1 || trimmed.contains(RegExp(r'[^\d]'))) return false;
    return trimmed.split('').toList().indexed.fold(0, (sum, element) {
              var i = trimmed.length - element.$1 - 1;
              var n = int.parse(trimmed[i]);
              if (i % 2 == (trimmed.length.isEven ? 0 : 1)) {
                final doubledNumber = n * 2;
                return sum +
                    (doubledNumber > 9 ? doubledNumber - 9 : doubledNumber);
              }
              return sum + n;
            }) %
            10 ==
        0;
  }
}
