import 'dart:math' show pow;

class ResistorColorTrio {
  static const List<String> _resistors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ];

  String label(List<String> bands) {
    var [tens, ones, multiplier, ...] = bands;
    num ohms =
        ((_resistors.indexOf(tens) * pow(10, 1)) +
            (_resistors.indexOf(ones) * pow(10, 0))) *
        pow(10, _resistors.indexOf(multiplier));
    return switch (ohms) {
      > 1e9 => '${ohms ~/ 1e9} gigaohms',
      > 1e6 => '${ohms ~/ 1e6} megaohms',
      > 1e3 => '${ohms ~/ 1e3} kiloohms',
      _ => '${ohms} ohms',
    };
  }
}
