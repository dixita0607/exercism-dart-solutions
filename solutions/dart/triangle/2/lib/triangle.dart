class Triangle {
  static bool _isValidTriangle(num sideOne, num sideTwo, num sideThree) =>
      (sideOne > 0 && sideTwo > 0 && sideThree > 0) &&
      ((sideOne + sideTwo >= sideThree) &&
          (sideTwo + sideThree >= sideOne) &&
          (sideThree + sideOne >= sideTwo));

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