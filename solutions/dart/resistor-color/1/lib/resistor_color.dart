class ResistorColor {
  static const Map<String, int> colorCoding = const {
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

  List<String> colors = colorCoding.keys.toList();
  int colorCode(String color) => colorCoding[color.toLowerCase()] ?? 0;
}