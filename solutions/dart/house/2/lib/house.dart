class House {
  static const List<List<String>> _relativeClauses = const [
    ['house', 'Jack built.'],
    ['malt', 'lay in'],
    ['rat', 'ate'],
    ['cat', 'killed'],
    ['dog', 'worried'],
    ['cow with the crumpled horn', 'tossed'],
    ['maiden all forlorn', 'milked'],
    ['man all tattered and torn', 'kissed'],
    ['priest all shaven and shorn', 'married'],
    ['rooster', 'crowed in the morn that woke'],
    ['farmer sowing his corn', 'kept'],
    ['horse and the hound and the horn', 'belonged to'],
  ];

  String recite(int start, int end) {
    List<String> song = [];
    for (int i = start; i <= end; i++) {
      song.add(
        'This is the ${_relativeClauses.sublist(0, i).reversed.map((str) => str.join(' that ')).join(' the ')}',
      );
    }
    return song.join('\n');
  }
}

