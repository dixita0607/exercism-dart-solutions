List<int> getMultiples(int of, int upto) {
  if (of == 0) return [0];
  List<int> multiples = [];
  int number = of;
  while (number < upto) {
    multiples.add(number);
    number += of;
  }
  return multiples;
}

class SumOfMultiples {
  int sum(List<int> itemValues, int level) {
    Set<int> multiples = Set();
    for (int item in itemValues) {
      multiples.addAll(getMultiples(item, level));
    }
    return multiples.fold(0, (total, multiple) => total + multiple);
  }
}