class Diamond {
  static final int _A = 'A'.codeUnitAt(0);
  static final String _padding = ' ';

  List<String> rows(String letter) {
    int size = (letter.codeUnitAt(0) - _A) * 2 + 1;
    int halfSize = size ~/ 2;
    List<String> firstHalfOfDiamond = List.generate(
        halfSize + 1,
        (rowIndex) => List.generate(size, (cellIndex) {
              return cellIndex == halfSize - rowIndex ||
                      cellIndex == halfSize + rowIndex
                  ? String.fromCharCode(_A + rowIndex)
                  : _padding;
            }).join(''));

    return [
      ...firstHalfOfDiamond,
      ...firstHalfOfDiamond.reversed.toList().sublist(1)
    ];
  }
}
