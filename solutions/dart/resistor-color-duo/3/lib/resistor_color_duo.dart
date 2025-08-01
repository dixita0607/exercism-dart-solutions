enum Resistor {
  black(0),
  brown(1),
  red(2),
  orange(3),
  yellow(4),
  green(5),
  blue(6),
  violet(7),
  grey(8),
  white(9);

  final int resistance;

  const Resistor(this.resistance);

  factory Resistor.fromColor(String string) {
    try {
      return Resistor.values.firstWhere((value) => value.name == string);
    } on StateError {
      throw FormatException('Unknown resistor color', string, 0);
    }
  }
}

class ResistorColorDuo {
  int value(List<String> sequence) {
    RangeError.checkValidRange(2, null, sequence.length);
    final [first, second, ...] = sequence;
    return _addResistance(Resistor.fromColor(first), Resistor.fromColor(second));
  }

  static int _addResistance(Resistor first, Resistor second) =>
      first.resistance * 10 + second.resistance;
}
