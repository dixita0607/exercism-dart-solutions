class WordCount {
  Map<String, int> countWords(String subtitles) => subtitles
      .toLowerCase()
      .split(RegExp(r"[^\w']+"))
      .map((s) => s.trim().replaceAll(RegExp(r"^'|'$"), ''))
      .where((s) => s.isNotEmpty)
      .fold<Map<String, int>>({}, (map, s) {
        if (map[s] == null) {
          map[s] = 1;
        } else {
          map[s] = map[s]! + 1;
        }
        return map;
      });
}
