enum Plant {
  radishes('R'),
  clover('C'),
  violets('V'),
  grass('G');

  final String acronym;
  const Plant(this.acronym);

  factory Plant.fromAcronym(String acronym) {
    try {
      return Plant.values.firstWhere((value) => value.acronym == acronym);
    } on StateError {
      throw ArgumentError('Invalid acronym');
    }
  }
}

enum Student {
  Alice,
  Bob,
  Charlie,
  David,
  Eve,
  Fred,
  Ginny,
  Harriet,
  Ileana,
  Joseph,
  Kincaid,
  Larry,
}

class KindergartenGarden {
  String garden;
  KindergartenGarden(this.garden);

  List<Plant> plants(Student student) {
    final turnInGarden = student.index * 2;
    return garden.split('\n').fold([], (acc, gs) {
      acc.addAll([
        Plant.fromAcronym(gs[turnInGarden]),
        Plant.fromAcronym(gs[turnInGarden + 1]),
      ]);
      return acc;
    });
  }
}
