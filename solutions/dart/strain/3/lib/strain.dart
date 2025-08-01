// Use more basic approach. Avoid using inbuilt method.

class Strain {
  keep(values, predicate) {
    final filteredList = [];
    for (int i = 0; i < values.length; i++) {
      if (predicate(values[i])) filteredList.add(values[i]);
    }
    return filteredList;
  }

  discard(values, predicate) => keep(values, (item) => !predicate(item));
}