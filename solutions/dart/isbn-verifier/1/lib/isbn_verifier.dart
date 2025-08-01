bool isValid(String isbn) {
  final String cleanIsbn = isbn.replaceAll(RegExp(r'-'), '');
  if (cleanIsbn.length != 10) return false;
  if (cleanIsbn.substring(0, 9).contains(RegExp(r'[^0-9]'))) return false;
  if (!cleanIsbn.substring(9).contains(RegExp(r'[0-9]|X'))) return false;
  if (RegExp('r[^0-9X]').hasMatch(cleanIsbn.substring(9))) return false;
  return cleanIsbn
              .split('')
              .map((s) => s == 'X' ? 10 : int.parse(s))
              .indexed
              .fold(
                  0,
                  (sum, item) =>
                      sum + (item.$2 * (cleanIsbn.length - item.$1))) %
          11 ==
      0;
}
