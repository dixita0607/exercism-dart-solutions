class Pangram {
  static const List<String> _alphabets = const [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  bool isPangram(String sentence) {
    String onlyCharacters = sentence.toLowerCase().replaceAll(
      RegExp(r'\W'),
      '',
    );
    if (onlyCharacters.length < 26) return false;
    for (String character in _alphabets) {
      if (!onlyCharacters.contains(character)) return false;
    }
    return true;
  }
}