class Etl {
  Map<String, int> transform(Map<String, List<String>> currentScoring) =>
      Map.fromEntries(
        currentScoring.entries.expand(
          (entry) => _score(entry.value, int.parse(entry.key)),
        ),
      );

  static Iterable<MapEntry<String, int>> _score(
    List<String> letters,
    int value,
  ) sync* {
    for (var i = 0; i < letters.length; i++) {
      yield MapEntry(letters[i].toLowerCase(), value);
    }
  }
}
