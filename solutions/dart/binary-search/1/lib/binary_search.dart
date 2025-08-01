import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  final list;
  BinarySearch(List<int> list) : this.list = (list..sort());

  int find(int number) {
    if (list.length == 0) throw ValueNotFoundException('');
    if (list.length == 1) return 0;
    return _findMid(number, 0, list.length - 1);
  }

  int _findMid(int number, int low, int high) {
    try {
      final mid = low + ((high - low) ~/ 2);
      if (number == list[mid]) return mid;
      if (low == high) throw ValueNotFoundException('');
      if (number < list[mid]) return _findMid(number, low, mid - 1);
      if (number > list[mid]) return _findMid(number, mid + 1, high);
      throw ValueNotFoundException('');
    } catch (e) {
      throw ValueNotFoundException('');
    }
  }
}

