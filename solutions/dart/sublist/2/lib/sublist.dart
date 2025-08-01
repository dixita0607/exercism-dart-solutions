enum Classification { equal, sublist, superlist, unequal }

extension SublistExtended<T> on List<T> {
  bool isEqualTo(List<T> anotherList) =>
      this.length != anotherList.length
          ? false
          : this.indexed.every((item) => item.$2 == anotherList[item.$1]);

  bool isSublistOf(List<T> anotherList) {
    if (anotherList.length < this.length) {
      return false;
    } else {
      for (int i = 0; i <= anotherList.length - this.length; i++) {
        if (this.isEqualTo(anotherList.sublist(i, i + this.length))) {
          return true;
        }
      }
      return false;
    }
  }

  Classification classifiedSublist(List<T> anotherList) {
    if (this.isEqualTo(anotherList)) return Classification.equal;
    if (this.isSublistOf(anotherList)) return Classification.sublist;
    if (anotherList.isSublistOf(this)) return Classification.superlist;
    return Classification.unequal;
  }
}

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) =>
      listOne.classifiedSublist(listTwo);
}