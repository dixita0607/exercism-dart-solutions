class RotationalCipher {
  String rotate({String text = '', int shiftKey = 0}) {
    String cipher = '';
    final capitals = RegExp(r'[A-Z]');
    final smalls = RegExp(r'[a-z]');
    for (String character in text.split('')) {
      int nextUnit = character.codeUnitAt(0) + shiftKey;
      if (capitals.hasMatch(character)) {
        cipher +=
            String.fromCharCode(nextUnit > 90 ? (nextUnit - 26) : nextUnit);
      } else if (smalls.hasMatch(character)) {
        cipher +=
            String.fromCharCode(nextUnit > 122 ? (nextUnit - 26) : nextUnit);
      } else
        cipher += character;
    }
    return cipher;
  }
}