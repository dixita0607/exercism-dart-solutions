class BeerSong {
  List<String> recite(int totalBottles, int bottlesToTake) {
    int differenceInBottles = totalBottles - bottlesToTake;
    List<String> song = [];
    for (int i = totalBottles; i > differenceInBottles; i--) {
      switch (i) {
        case 0:
          song.addAll([
            'No more bottles of beer on the wall, no more bottles of beer.',
            'Go to the store and buy some more, 99 bottles of beer on the wall.',
          ]);
        case 1:
          song.addAll([
            '1 bottle of beer on the wall, 1 bottle of beer.',
            'Take it down and pass it around, no more bottles of beer on the wall.',
          ]);
        case _:
          song.addAll([
            '${i} bottles of beer on the wall, ${i} bottles of beer.',
            'Take one down and pass it around, ${i - 1} bottle${i - 1 == 1 ? '' : 's'} of beer on the wall.',
          ]);
      }
      if (i != differenceInBottles + 1) song.add('');
    }
    return song;
  }
}