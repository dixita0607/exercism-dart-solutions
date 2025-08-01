class Diamond {
  List<String> rows(String letter) {
    int size = (letter.codeUnitAt(0) - 65) * 2 + 1;
    return List.generate(
        size,
        (rowIndex) => List.generate(size, (cellIndex) {
              int centerRow = size ~/ 2;
              int rowIndexAfterCenter = size - rowIndex - 1;
              return cellIndex == centerRow - rowIndex ||
                      cellIndex == centerRow + rowIndex ||
                      cellIndex == centerRow - rowIndexAfterCenter ||
                      cellIndex == centerRow + rowIndexAfterCenter
                  ? String.fromCharCode(rowIndex <= centerRow
                      ? 65 + rowIndex
                      : 65 + rowIndexAfterCenter)
                  : '';
            }).join(''));
  }
}

void main() {
  print(Diamond().rows('D'));
}
