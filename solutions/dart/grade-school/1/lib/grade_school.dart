import 'dart:collection';

class GradeSchool {
  final students =
      SplayTreeMap<int, SplayTreeSet<String>>((a, b) => a.compareTo(b));

  List<String> grade(int grade) =>
      students[grade] == null ? [] : List<String>.from(students[grade]!);

  List<String> roster() => students.values.fold<List<String>>(
      [],
      (combinedStudents, gradeWiseStudents) =>
          [...combinedStudents, ...gradeWiseStudents]);

  List<bool> add(List<(String, int)> gradeWiseStudents) {
    return gradeWiseStudents.map((student) {
      final (name, grade) = student;
      if (students[grade] == null)
        students[grade] = SplayTreeSet<String>((a, b) => a.compareTo(b));
      return _isAdded(name) ? false : students[grade]!.add(name);
    }).toList();
  }

  bool _isAdded(String student) {
    bool isAdded = false;
    for (final names in students.values) {
      if (names.contains(student)) isAdded = true;
      break;
    }
    return isAdded;
  }
}