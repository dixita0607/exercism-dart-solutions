class Etl {
  Map<String, int> transform(Map<String, List<String>> currentScoringMechanism) {
    Map<String, int> newScoringMechanism = {};
    currentScoringMechanism.forEach((score, letters) {
      newScoringMechanism.addEntries(
        Map<String, int>.fromIterable(
          letters,
          key: (letter) => letter.toLowerCase(),
          value: (letter) => int.parse(score),
        ).entries,
      );
    });
    return newScoringMechanism;
  }
}