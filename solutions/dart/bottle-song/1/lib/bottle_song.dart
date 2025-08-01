class BottleSong {
  static const Map<int, String> _numberToString = const {
    1: 'One',
    2: 'Two',
    3: 'Three',
    4: 'Four',
    5: 'Five',
    6: 'Six',
    7: 'Seven',
    8: 'Eight',
    9: 'Nine',
    10: 'Ten',
  };

  List<String> recite(int bottles, int brokenBottles) {
    List<String> song = [];
    for (int i = bottles; i > bottles - brokenBottles; i--) {
      if (i == 1) {
        song.addAll([
          'One green bottle hanging on the wall,',
              'One green bottle hanging on the wall,',
              'And if one green bottle should accidentally fall,',
          "There'll be no green bottles hanging on the wall.",
        ]);
      } else {
        song.addAll([
          '${_numberToString[i]} green bottles hanging on the wall,',
          '${_numberToString[i]} green bottles hanging on the wall,',
          'And if one green bottle should accidentally fall,',
          "There'll be ${_numberToString[i - 1]?.toLowerCase()} green bottle${i - 1 > 1 ? 's' : ''} hanging on the wall.",
        ]);
      }
      if (i - (bottles - brokenBottles) != 1) song.add('');
    }
    return song;
  }
}
