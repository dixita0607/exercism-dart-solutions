// A imperative way. The previous solution has more functional one.

class Sieve {
  int upto;
  Sieve(this.upto);

  late List<int> unmarked = List.generate(upto - 1, (_) => 1);

  List<int> get primes {
    List<int> primes = [];
    for (int i = 2; i <= upto; i++) {
      if (unmarked[i - 2] == 1) {
        primes.add(i);
        for (int j = i * 2; j <= upto; j += i) {
          if (unmarked[j - 2] == 1) unmarked[j - 2] = 0;
        }
      }
    }
    return primes;
  }
}