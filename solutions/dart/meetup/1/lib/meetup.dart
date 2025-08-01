enum Weekday {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  final int day;
  const Weekday(this.day);

  factory Weekday.fromName(String dayName) {
    try {
      return Weekday.values
          .firstWhere((value) => value.name == dayName.toLowerCase());
    } on StateError {
      throw ArgumentError('Invalid weekday');
    }
  }
}

class Meetup {
  String meetup(
      {required int year,
      required int month,
      required String week,
      required String dayofweek}) {
    final firstDay =
        DateTime.parse('${year}-${month < 10 ? '0$month' : month}-01');
    final weekday = Weekday.fromName(dayofweek).day;
    switch (week) {
      case "first":
        return _getNthDayOfNthWeek(startDate: firstDay, day: weekday);
      case "second":
        return _getNthDayOfNthWeek(
            startDate: firstDay.add(Duration(days: 7)), day: weekday);
      case "third":
        return _getNthDayOfNthWeek(
            startDate: firstDay.add(Duration(days: 14)), day: weekday);
      case "fourth":
        return _getNthDayOfNthWeek(
            startDate: firstDay.add(Duration(days: 21)), day: weekday);
      case "last":
        {
          int nextMonth = (month + 1) > 12 ? (month + 1) % 12 : month + 1;
          int nextYear = nextMonth == 1 ? year + 1 : year;
          DateTime lastDay = DateTime.parse(
                  '${nextYear}-${nextMonth < 10 ? '0$nextMonth' : nextMonth}-01')
              .subtract(Duration(days: 1));
          DateTime resultDay = lastDay;
          for (int i = lastDay.weekday;
              i > lastDay.weekday - 7;
              i = ((i - 1) % 7).abs()) {
            if (resultDay.weekday == weekday) break;
            resultDay = resultDay.subtract(Duration(days: 1));
          }
          return _formatDate(resultDay);
        }
      default:
        return _getNthDayOfNthWeek(
            startDate: firstDay.add(Duration(days: 12)), day: weekday);
    }
  }

  static String _formatDate(DateTime date) =>
      '${date.year}-${date.month < 10 ? '0${date.month}' : date.month}-${date.day < 10 ? '0${date.day}' : date.day}';

  static String _getNthDayOfNthWeek(
      {required DateTime startDate, required day}) {
    DateTime resultDay = startDate;
    for (int i = startDate.weekday;
        i < startDate.weekday + 7;
        i = (i + 1) % 7) {
      if (resultDay.weekday == day) break;
      resultDay = resultDay.add(Duration(days: 1));
    }
    return _formatDate(resultDay);
  }
}
