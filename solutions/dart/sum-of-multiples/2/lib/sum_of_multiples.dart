List<int> getMultiples(int of, int upto) =>
    of == 0
        ? [0]
        : List.generate(
          upto,
          (i) => i,
        ).where((index) => index != 0 && index % of == 0).toList();

class SumOfMultiples {
  int sum(List<int> itemValues, int level) {
    Set<int> multiples = Set();
    for (int item in itemValues) {
      multiples.addAll(getMultiples(item, level));
    }
    return multiples.fold(0, (total, multiple) => total + multiple);
  }
}
