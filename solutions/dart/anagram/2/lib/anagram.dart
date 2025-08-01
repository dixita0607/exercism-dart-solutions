class Anagram {
  List<String> findAnagrams(String word, List<String> candidates) {
    return candidates.where((candidate) {
      String lowerCaseWord = word.toLowerCase();
      String lowerCaseCandidate = candidate.toLowerCase();
      return word.length != candidate.length ||
              lowerCaseWord == lowerCaseCandidate
          ? false
          : (lowerCaseWord.split('')..sort()).join('') ==
              (lowerCaseCandidate.split('')..sort()).join('');
    }).toList();
  }
}