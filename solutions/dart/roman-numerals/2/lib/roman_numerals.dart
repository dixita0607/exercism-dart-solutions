extension ConvertToRomanNumerals on int {
  static const _arabicToRoman = const {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
  };

  String toRoman() {
    if (_arabicToRoman[this] != null) return _arabicToRoman[this]!;
    final romans = [];
    int number = this;
    List<int> numbers = _arabicToRoman.keys.toList();
    for (int n in numbers) {
      while (number >= n) {
        romans.add(_arabicToRoman[n]);
        number -= n;
      }
    }
    return romans.join('');
  }
}
