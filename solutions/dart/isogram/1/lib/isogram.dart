class Isogram {
  bool isIsogram(String word) {
    final Map<int, int> letterCounts = {};
    for (int codeUnit in word.toUpperCase().codeUnits) {
      if (codeUnit >= 65 && codeUnit <= 97) {
        if (letterCounts[codeUnit] == 1) return false;
        letterCounts[codeUnit] = 1;
      }
    }
    return true;
  }
}