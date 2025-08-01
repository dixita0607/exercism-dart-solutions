class Luhn {
  bool valid(String number) {
    String trimmed = number.replaceAll(RegExp(r'\s'), '');
    return (trimmed.length <= 1 || trimmed.contains(RegExp(r'[^\d]')))
        ? false
        : trimmed.split('').reversed.indexed.fold<int>(0, (sum, element) {
                  int i = element.$1;
                  int n = int.parse(element.$2);
                  if (i.isOdd) n *= 2;
                  if (n > 9) n -= 9;
                  return sum + n;
                }) %
                10 ==
            0;
  }
}
