class Triangle {
  static bool _isValidTriangle(num sideOne, num sideTwo, num sideThree) {
    var sides = [sideOne, sideTwo, sideThree]..sort();
    return (sides[0] > 0) && (sides[0] + sides[1] >= sides[2]);
  }

  bool equilateral(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree) &&
      (sideOne == sideTwo && sideOne == sideThree);

  bool isosceles(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree) &&
      (sideOne == sideTwo || sideTwo == sideThree || sideThree == sideOne);

  bool scalene(num sideOne, num sideTwo, num sideThree) =>
      _isValidTriangle(sideOne, sideTwo, sideThree) &&
      (sideOne != sideTwo && sideTwo != sideThree && sideThree != sideOne);
}
