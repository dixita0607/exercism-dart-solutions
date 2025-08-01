class Strain {
  keep(values, predicate) => List.from(values.where(predicate));
  discard(values, predicate) =>
      List.from(values.where((item) => !predicate(item)));
}
