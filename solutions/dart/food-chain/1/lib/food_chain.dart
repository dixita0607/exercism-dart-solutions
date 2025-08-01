class FoodChain {
  static const exclamations = const [
    ('fly', ''),
    ('spider', "It wriggled and jiggled and tickled inside her."),
    ('bird', "How absurd to swallow a bird!"),
    ('cat', "Imagine that, to swallow a cat!"),
    ('dog', "What a hog, to swallow a dog!"),
    ('goat', "Just opened her throat and swallowed a goat!"),
    ('cow', "I don't know how she swallowed a cow!"),
    ('horse', "She's dead, of course!"),
  ];

  List<String> recite(int start, int repeat) {
    final List<String> song = [];
    for (int i = start; i <= repeat; i++) {
      song.addAll([..._getStanza(i), if (i != repeat) '']);
    }
    return song;
  }

  List<String> _getStanza(int end) {
    if (end == exclamations.length)
      return [
        "I know an old lady who swallowed a horse.",
        "She's dead, of course!"
      ];

    List<String> stanza = [];
    final exclamationsList = exclamations.sublist(0, end).reversed.toList();
    exclamationsList.indexed.forEach((indexedElement) {
      final (i, (animal, exclamation)) = indexedElement;
      if (animal == 'fly') {
        if (end == 1) stanza.add('I know an old lady who swallowed a fly.');
        stanza
            .add("I don't know why she swallowed the fly. Perhaps she'll die.");
        return;
      }
      if (i == 0)
        stanza.addAll(
            ['I know an old lady who swallowed a $animal.', exclamation]);
      final nextAnimal = exclamationsList[i + 1].$1;
      final nextExclamation = nextAnimal == 'spider'
          ? ' that ${exclamationsList[i + 1].$2.substring(3)}'
          : '.';
      stanza.add(
          "She swallowed the $animal to catch the ${nextAnimal}${nextExclamation}");
    });
    return stanza;
  }
}
