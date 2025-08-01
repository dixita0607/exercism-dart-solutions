class Triangle {
  static bool _isValidTriangle(num sideOne, num sideTwo, num sideThree) {
    List<num> sides = [sideOne, sideTwo, sideThree]..sort();
    return (sideOne > 0 && sideTwo > 0 && sideThree > 0) &&
        (sides[0] + sides[1] >= sides[2]);
  }

  bool equilateral(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree)
          ? (sideOne == sideTwo && sideOne == sideThree)
          : false;

  bool isosceles(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree)
          ? (sideOne == sideTwo || sideTwo == sideThree || sideThree == sideOne)
          : false;

  bool scalene(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree)
          ? (sideOne != sideTwo && sideTwo != sideThree && sideThree != sideOne)
          : false;
}