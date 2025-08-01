class House {
  static const List<String> _verbs = const [
    'built',
    'lay in',
    'ate',
    'killed',
    'worried',
    'tossed',
    'milked',
    'kissed',
    'married',
    'woke',
    'kept',
    'belonged to',
  ];

  static const List<String> _nouns = const [
    'house',
    'malt',
    'rat',
    'cat',
    'dog',
    'cow with the crumpled horn',
    'maiden all forlorn',
    'man all tattered and torn',
    'priest all shaven and shorn',
    'rooster that crowed in the morn',
    'farmer sowing his corn',
    'horse and the hound and the horn',
  ];

  static String _createVerse(int start) {
    if (start == 1) return 'This is the house that Jack built.';
    List<String> verse = ['This is '];
    for (int i = start - 1; i > 0; i--) {
      verse.add(
        '${i == start - 1 ? 'the ${_nouns[i]}' : ''} that ${_verbs[i]} the ${_nouns[i - 1]}',
      );
    }
    verse.add(' that Jack built.');
    return verse.join('');
  }

  String recite(int start, int end) {
    List<String> song = [];
    for (int i = start; i <= end; i++) {
      song.add(_createVerse(i));
    }
    return song.join('\n');
  }
}
