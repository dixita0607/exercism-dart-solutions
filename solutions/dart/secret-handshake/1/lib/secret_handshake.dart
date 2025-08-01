const List<String> _actions = const [
  'wink',
  'double blink',
  'close your eyes',
  'jump',
  'reverse'
];

class SecretHandshake {
  List<String> commands(int number) {
    if (number < 1 || number > 31) return [];
    final List<String> actions = [];
    for (int i = 0; number > 0; number ~/= 2, i++) {
      if (number % 2 == 1) actions.add(_actions[i]);
    }
    return actions.last == 'reverse'
        ? actions.reversed.toList().sublist(1)
        : actions;
  }
}
