class PascalsTriangle {
  List<List<int>> rows(int numberOfRows) {
    if (numberOfRows == 0) return [];
    List<List<int>> triangle = [];
    for (int i = 0; i < numberOfRows; i++) {
      triangle.add([]);
      for (int j = 0; j <= i; j++) {
        if (i == 0 || j == 0 || j == i) {
          triangle[i].add(1);
        } else {
          triangle[i].add(triangle[i - 1][j - 1] + triangle[i - 1][j]);
        }
      }
    }
    return triangle;
  }
}