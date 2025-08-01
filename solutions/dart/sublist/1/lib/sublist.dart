enum Classification { equal, sublist, superlist, unequal }

extension SublistExtended<T> on List<T> {
  
  bool isEqualTo(List<T> anotherList) =>
      this.length != anotherList.length
          ? false
          : this.indexed.every((item) => item.$2 == anotherList[item.$1]);

  bool isSublistOf(List<T> anotherList) {
    if (anotherList.length < this.length) {
      throw 'Another list must be larger than my list';
    } else {
      for (int i = 0; i <= anotherList.length - this.length; i++) {
        if (this.isEqualTo(anotherList.sublist(i, i + this.length))) {
          return true;
        }
      }
      return false;
    }
  }

  Classification classifiedSublist(List<T> anotherList) => switch (this.length
      .compareTo(anotherList.length)) {
    0 =>
      this.isEqualTo(anotherList)
          ? Classification.equal
          : Classification.unequal,
    1 =>
      anotherList.isSublistOf(this)
          ? Classification.superlist
          : Classification.unequal,
    -1 =>
      this.isSublistOf(anotherList)
          ? Classification.sublist
          : Classification.unequal,
    _ => Classification.unequal,
  };
}

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) =>
      listOne.classifiedSublist(listTwo);
}