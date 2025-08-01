import 'dart:math' show pow;

class ResistorColorTrio {
  static const Map<String, int> _resistors = const {
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

  String label(List<String> colors) {
    num ohms =
        ((_resistors[colors[0]]! * pow(10, 1)) +
            (_resistors[colors[1]]! * pow(10, 0))) *
        pow(10, _resistors[colors[2]]!);
    return switch (ohms) {
      > 1000000000 => '${ohms ~/ 1000000000} gigaohms',
      > 1000000 => '${ohms ~/ 1000000} megaohms',
      > 1000 => '${ohms ~/ 1000} kiloohms',
      _ => '${ohms} ohms',
    };
  }
}