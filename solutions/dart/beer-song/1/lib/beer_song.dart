class BeerSong {
  List<String> recite(int totalBottles, int bottlesToTake) {
    List<String> song = [];
    for (int i = totalBottles; i > totalBottles - bottlesToTake; i--) {
      song.addAll([
        if (i != 0)
          '${i} bottle${i == 1 ? '' : 's'} of beer on the wall, ${i} bottle${i == 1 ? '' : 's'} of beer.',
        if (i != 0)
          'Take ${i == 1 ? 'it' : 'one'} down and pass it around, ${i == 1 ? 'no more' : i - 1} bottle${i - 1 == 1 ? '' : 's'} of beer on the wall.',
        if (i != totalBottles - bottlesToTake + 1) '',
        if (i == 0)
          'No more bottles of beer on the wall, no more bottles of beer.',
        if (i == 0)
          'Go to the store and buy some more, 99 bottles of beer on the wall.',
      ]);
    }
    return song;
  }
}