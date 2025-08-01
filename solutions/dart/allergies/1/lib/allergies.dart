import 'package:collection/collection.dart';

List<int> getBinary(int number) {
  int remainder = number % 2;
  int quotient = number ~/ 2;
  List<int> binary = [];
  while (quotient != 0) {
    binary.insert(0, remainder);
    remainder = quotient % 2;
    quotient = quotient ~/ 2;
  }
  binary.insert(0, remainder);
  return binary;
}

class Allergies {
  static const List<String> allergyValues = [
    'eggs',
    'peanuts',
    'shellfish',
    'strawberries',
    'tomatoes',
    'chocolate',
    'pollen',
    'cats',
  ];

  List<String> list(int allergyScore) => getBinary(
    allergyScore,
  ).reversed.foldIndexed([], (index, allergies, twosPower) {
    if (twosPower == 1 && index < allergyValues.length) {
      allergies.add(allergyValues[index]);
    }
    return allergies;
  });

  bool allergicTo(String allergy, int score) =>
      score == 0 ? false : list(score).contains(allergy);
}