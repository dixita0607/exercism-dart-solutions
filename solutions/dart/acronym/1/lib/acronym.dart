class Acronym {
  String abbreviate(String longName) =>
      longName.split(RegExp(r'\s|-')).fold('', (abbreviation, word) {
        String alphabeticWord = word.replaceAll(
          RegExp(r'[^a-z]', caseSensitive: false),
          '',
        );
        return alphabeticWord.isNotEmpty
            ? '$abbreviation${alphabeticWord[0].toUpperCase()}'
            : abbreviation;
      });
}