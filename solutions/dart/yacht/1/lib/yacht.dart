import 'package:yacht/categories.dart';

class Yacht {
  List<int> throws;
  Yacht(this.throws)
      : assert(throws.length >= 1 && throws.length <= 5,
            'Invalid number of throws'),
        assert(!throws.any((dice) => (dice < 1 || dice > 6)),
            'Invalid dice value');

  int score(Category category) => switch (category) {
        Category.ones => _ns(1),
        Category.twos => _ns(2),
        Category.threes => _ns(3),
        Category.fours => _ns(4),
        Category.fives => _ns(5),
        Category.sixes => _ns(6),
        Category.full_house => _fullHouse(),
        Category.four_of_a_kind => _fourOfAKind(),
        Category.little_straight => _straights(1),
        Category.big_straight => _straights(2),
        Category.choice => throws.fold<int>(0, (total, dice) => total + dice),
        Category.yacht =>
          throws.sublist(1).every((dice) => dice == throws.first) ? 50 : 0,
      };

  int _ns(int faceValue) =>
      faceValue * throws.where((dice) => dice == faceValue).length;

  int _fullHouse() {
    if (Set.from(throws).length > 2) return 0;
    List<int> totals = [1, 0];
    throws
        .sublist(1)
        .forEach((dice) => totals[dice == throws.first ? 0 : 1] += 1);
    return totals.first == 2 && totals[1] == 3
        ? (totals.first * throws.first) +
            (totals[1] * throws.firstWhere((dice) => dice != throws.first))
        : 0;
  }

  int _fourOfAKind() {
    if (Set.from(throws).length > 2) return 0;
    final totals =
        throws.sublist(1).fold<Map<int, int>>({throws.first: 1}, (acc, dice) {
      if (dice != throws.first)
        acc[dice] = 1;
      else
        acc[dice] = acc[dice]! + 1;
      return acc;
    });
    return totals.entries.fold(
        0, (score, entry) => score + (entry.value >= 4 ? (entry.key * 4) : 0));
  }

  int _straights(int difference) => (throws..sort())
              .indexed
              .takeWhile((dice) => dice.$2 == (dice.$1 + difference))
              .length ==
          5
      ? 30
      : 0;
}
