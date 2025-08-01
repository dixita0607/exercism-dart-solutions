class ResistorColorDuo {
  static const Map<String, int> _colorCoding = const {
    'black': 0,
    'brown': 1,
    'red': 2,
    'orange': 3,
    'yellow': 4,
    'green': 5,
    'blue': 6,
    'violet': 7,
    'grey': 8,
    'white': 9,
  };

  int value(List<String> sequence) {
    return sequence
        .sublist(0, 2)
        .fold<int>(
          0,
          (resistorValue, color) =>
              resistorValue * 10 + (_colorCoding[color.toLowerCase()] ?? 0),
        );
  }
}