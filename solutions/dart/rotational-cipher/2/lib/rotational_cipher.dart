class RotationalCipher {
  static const _A = 65;
  static const _Z = 90;
  static const _a = 97;
  static const _z = 122;
  String rotate({String text = '', int shiftKey = 0}) =>
      String.fromCharCodes(text.codeUnits.map((unit) => switch (unit) {
            >= _A && <= _Z => _A + (unit - _A + shiftKey) % 26,
            >= _a && <= _z => _a + (unit - _a + shiftKey) % 26,
            _ => unit
          }));
}