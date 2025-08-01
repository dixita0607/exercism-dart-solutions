import 'dart:math' show min;

class Allergies {
  static const List<String> _allergents = [
    'eggs',
    'peanuts',
    'shellfish',
    'strawberries',
    'tomatoes',
    'chocolate',
    'pollen',
    'cats',
  ];

  List<String> list(int allergentScore) {
    String binaryAllergentScore = allergentScore.toRadixString(2);
    return List.generate(
      min(binaryAllergentScore.length, _allergents.length),
      (index) =>
          binaryAllergentScore[binaryAllergentScore.length - 1 - index] == '1'
              ? _allergents[index]
              : '',
    ).where((item) => item.isNotEmpty).toList();
  }

  bool allergicTo(String allergent, int score) =>
      score == 0 ? false : list(score).contains(allergent);
}
