class MatchingBrackets {
  static const Map<String, String> _bracketsMapping = const {
    '{': '}',
    '(': ')',
    '[': ']'
  };
  static const String _brackets = '{}()[]';

  bool isPaired(String input) {
    List<String> brackets = input
        .split('')
        .where((character) => _brackets.contains(character))
        .toList();
    if (brackets.length == 0) return true;
    if (brackets.length.isOdd)
      return false;
    else
      return brackets.sublist(0, brackets.length ~/ 2).indexed.every((element) {
        var (index, bracket) = element;
        return _bracketsMapping[bracket] ==
            brackets[brackets.length - index - 1];
      });
  }
}
