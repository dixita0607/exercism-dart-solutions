class MatchingBrackets {
  static const Map<String, String> _openingBracket = const {
    '}': '{',
    ')': '(',
    ']': '['
  };
  static const String _openingBrackets = '{[(';
  static const String _closingBrackets = '}])';

  bool isPaired(String input) {
    List<String> pairs = [];
    for (int i = 0; i < input.length; i++) {
      String character = input[i];
      if (_openingBrackets.contains(character)) {
        pairs.add(character);
      } else if (_closingBrackets.contains(character)) {
        if (pairs.length > 0 && pairs.last == _openingBracket[character]) {
          pairs.removeLast();
        } else {
          return false;
        }
      } else
        continue;
    }
    return pairs.length == 0;
  }
}