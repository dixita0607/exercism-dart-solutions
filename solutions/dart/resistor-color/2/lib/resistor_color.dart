class ResistorColor {
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

  List<String> get colors => _colorCoding.keys.toList();
  int colorCode(String color) => _colorCoding[color.toLowerCase()] ?? 0;
}