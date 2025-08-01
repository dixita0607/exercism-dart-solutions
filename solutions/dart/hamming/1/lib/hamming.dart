class Hamming {
  int distance(String firstStrand, String secondStrand) {
    if (firstStrand.length != secondStrand.length) {
      throw ArgumentError('strands must be of equal length');
    }
    if (firstStrand == secondStrand) return 0;
    return firstStrand.codeUnits.indexed.fold<int>(0, (distance, item) {
      var (index, value) = item;
      if (value != secondStrand.codeUnitAt(index)) distance += 1;
      return distance;
    });
  }
}