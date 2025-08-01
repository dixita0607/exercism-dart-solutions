class Pangram {
  bool isPangram(String sentence) {
    String lowercaseSentence = sentence.toLowerCase();
    return 'abcdefghijklmnopqrstuvwxyz'
        .split('')
        .every((character) => lowercaseSentence.contains(character));
  }
}
