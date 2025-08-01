const earthYearInSeconds = 365.25 * 24 * 60 * 60;

class SpaceAge {
  double age({required String planet, required int seconds}) {
    double ageInPlanetYears = switch (planet) {
      'Earth' => seconds / (1 * earthYearInSeconds),
      'Venus' => seconds / (0.61519726 * earthYearInSeconds),
      'Mercury' => seconds / (0.2408467 * earthYearInSeconds),
      'Mars' => seconds / (1.8808158 * earthYearInSeconds),
      'Jupiter' => seconds / (11.862615 * earthYearInSeconds),
      'Saturn' => seconds / (29.447498 * earthYearInSeconds),
      'Uranus' => seconds / (84.016846 * earthYearInSeconds),
      'Neptune' => seconds / (164.79132 * earthYearInSeconds),
      _ => throw ArgumentError('Invalid planet name is passed'),
    };
    return double.parse(ageInPlanetYears.toStringAsFixed(2));
  }
}
