class Sieve {
  int upto;
  Sieve(this.upto);

  late List<MapEntry<int, bool>> unmarked =
      List.generate(upto - 1, (index) => MapEntry(index + 2, false));

  List<int> get primes {
    List<int> primes = [];
    for (int i = 0; i < unmarked.length; i++) {
      if (unmarked[i].value == false) {
        primes.add(unmarked[i].key);
        for (int j = i + 1; j < unmarked.length; j++) {
          if (unmarked[j].value == false &&
              (unmarked[j].key % unmarked[i].key == 0))
            unmarked[j] = MapEntry(unmarked[j].key, true);
        }
      }
    }
    return primes;
  }
}