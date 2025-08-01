class HighScores {
  List<int> scores;
  HighScores(this.scores);

  int latest() {
    // Expensive
    return scores.last;
  }

  int personalBest() {
    List<int> sorted = List.generate(scores.length, (i) => scores[i]);
    sorted.sort();
    return sorted.last;
  }

  List<int> personalTopThree() {
    List<int> sorted = List.generate(scores.length, (i) => scores[i]);
    sorted.sort();
    return (scores.length <= 3 ? sorted : sorted.sublist(scores.length - 3))
        .reversed
        .toList();
  }
}