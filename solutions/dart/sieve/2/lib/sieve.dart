class Sieve {
  int upto;
  Sieve(this.upto);

  late List<List<dynamic>> unmarked =
      List.generate(upto - 1, (index) => [index + 2, false]);

  List<int> get primes => unmarked.fold<List<int>>([], (ps, entry) {
        if (entry[1] == false) {
          ps.add(entry[0]);
          unmarked
              .where((e) => (e[0] > entry[0] && e[1] == false))
              .forEach((e) {
            if (e[0] % entry[0] == 0) e[1] = true;
          });
        }
        return ps;
      });
}
