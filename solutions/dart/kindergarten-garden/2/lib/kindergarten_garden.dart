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
  Alice(0),
  Bob(1),
  Charlie(2),
  David(3),
  Eve(4),
  Fred(5),
  Ginny(6),
  Harriet(7),
  Ileana(8),
  Joseph(9),
  Kincaid(10),
  Larry(11);

  final int turn;
  const Student(this.turn);
}

class KindergartenGarden {
  String garden;
  KindergartenGarden(this.garden);

  List<Plant> plants(Student student) {
    final turnInGarden = student.turn * 2;
    return garden.split('\n').fold([], (acc, gs) {
      acc.addAll([
        Plant.fromAcronym(gs[turnInGarden]),
        Plant.fromAcronym(gs[turnInGarden + 1]),
      ]);
      return acc;
    });
  }
}