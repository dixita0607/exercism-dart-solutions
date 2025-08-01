import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  final list;
  BinarySearch(List<int> list) : this.list = (list..sort());

  int find(int number) => _find(number, 0, list.length - 1);

  int _find(int number, int low, int high) {
    if (low > high) throw ValueNotFoundException('');
    final mid = (low + high) ~/ 2;
    if (number == list[mid]) return mid;
    if (low == high) throw ValueNotFoundException('');
    if (number > list[mid]) return _find(number, mid + 1, high);
    return _find(number, low, mid - 1);
  }
}