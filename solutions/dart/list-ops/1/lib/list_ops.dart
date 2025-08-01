extension ListOps on List {
  void append<T>(List<T> other) {
    for (T item in other) this.add(item);
  }

  List<T> concat<T>() => this.isEmpty
      ? []
      : [
          ...(this.first is List<T> ? this.first : [this.first]),
          ...this.sublist(1).concat()
        ];

  List<T> filter<T>(bool Function(T elem) predicate) => [
        for (T item in this)
          if (predicate(item)) item
      ];

  int count() {
    int total = 0;
    for (dynamic _ in this) total += 1;
    return total;
  }

  List<T> myMap<T>(T Function(T elem) fn) => [for (T item in this) fn(item)];

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    U result = initial;
    for (T item in this) result = fn(result, item);
    return result;
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    U result = initial;
    for (int i = this.length - 1; i >= 0; i--) result = fn(this[i], result);
    return result;
  }

  List<T> reverse<T>() {
    final List<T> result = [];
    for (int i = this.length - 1; i >= 0; i--) result.add(this[i]);
    return result;
  }
}
