class Bob {
  String response(String sentense) {
    String trimmedSentense = sentense.trim();
    if (trimmedSentense.isEmpty) return 'Fine. Be that way!';
    bool isQuestion = trimmedSentense.endsWith('?');
    bool isYelling =
        // Submission with better understood regexp.
        trimmedSentense.contains(RegExp(r'[a-zA-Z]')) &&
        trimmedSentense.toUpperCase() == trimmedSentense;
    if (isQuestion && isYelling) return "Calm down, I know what I'm doing!";
    if (isQuestion) return 'Sure.';
    if (isYelling) return 'Whoa, chill out!';
    return 'Whatever.';
  }
}