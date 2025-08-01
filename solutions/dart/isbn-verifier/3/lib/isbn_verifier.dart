bool isValid(String isbn) {
  final String cleanIsbn = isbn.replaceAll(RegExp(r'-'), '');
  return cleanIsbn.contains(RegExp(r'^\d{9}(\d|X)$'))
      ? cleanIsbn
                  .split('')
                  .map((s) => s == 'X' ? 10 : int.parse(s))
                  .indexed
                  .fold(
                      0,
                      (sum, item) =>
                          sum + (item.$2 * (cleanIsbn.length - item.$1))) %
              11 ==
          0
      : false;
}
