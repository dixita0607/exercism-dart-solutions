class Pangram {
  bool isPangram(String sentence) =>
      sentence
          .toLowerCase()
          .replaceAll(RegExp(r'[^a-z]'), '')
          .split('')
          .toSet()
          .length == 26;
}