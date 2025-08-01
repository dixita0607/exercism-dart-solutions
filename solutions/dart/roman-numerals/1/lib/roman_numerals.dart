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
    List<int> keys = _arabicToRoman.keys.toList();
    for (int i = 0; i < keys.length && number > 0; i++) {
      int dividor = keys[i];
      if (number >= dividor) {
        int r = number % dividor;
        int q = number ~/ dividor;
        number = r;
        if (q <= 3)
          romans.addAll(List.generate(q, (index) => _arabicToRoman[keys[i]]));
        else {
          romans.addAll([_arabicToRoman[dividor], _arabicToRoman[keys[i - 1]]]);
        }
      }
    }
    return romans.join('');
  }
}
