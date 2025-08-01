import 'package:yacht/categories.dart';

class Yacht {
  List<int> throws;
  Yacht(this.throws)
      : assert(throws.length >= 1 && throws.length <= 5,
            'Invalid number of throws'),
        assert(!throws.any((dice) => (dice < 1 || dice > 6)),
            'Invalid dice value');

  late Map<int, int> count = throws.fold({}, (acc, dice) {
    acc[dice] = (acc[dice] ?? 0) + 1;
    return acc;
  });

  int score(Category category) => switch (category) {
        Category.ones => _ns(1),
        Category.twos => _ns(2),
        Category.threes => _ns(3),
        Category.fours => _ns(4),
        Category.fives => _ns(5),
        Category.sixes => _ns(6),
        Category.full_house => _fullHouse(),
        Category.four_of_a_kind => _fourOfAKind(),
        Category.little_straight => _straights([1, 2, 3, 4, 5]),
        Category.big_straight => _straights([2, 3, 4, 5, 6]),
        Category.choice => _total(),
        Category.yacht => count[throws.first] == 5 ? 50 : 0,
      };

  int _total() => throws.fold<int>(0, (total, dice) => total + dice);

  int _ns(int faceValue) => faceValue * (count[faceValue] ?? 0);

  int _fullHouse() {
    if (count.length > 2) return 0;
    return count.containsValue(2) && count.containsValue(2) ? _total() : 0;
  }

  int _fourOfAKind() {
    if (count.length > 2) return 0;
    return count.entries.fold(
        0, (score, dice) => score + (dice.value >= 4 ? (dice.key * 4) : 0));
  }

  int _straights(List<int> sequence) => (throws..sort())
          .indexed
          .every((indexedDice) => indexedDice.$2 == sequence[indexedDice.$1])
      ? 30
      : 0;
}