class Anagram {
  List<String> findAnagrams(String word, List<String> candidates) {
    return candidates.where((candidate) {
      String lowerCaseWord = word.toLowerCase();
      String lowerCaseCandidate = candidate.toLowerCase();
      if (word.length != candidate.length ||
          lowerCaseWord.hashCode == lowerCaseCandidate.hashCode) {
        return false;
      }
      List<String> sortedWord = lowerCaseWord.split('')..sort();
      List<String> sortedCandidate = lowerCaseCandidate.split('')..sort();
      return sortedWord.join('') == sortedCandidate.join('');
    }).toList();
  }
}