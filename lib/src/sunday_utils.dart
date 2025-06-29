bool isLeapYear(int year) =>
    (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

DateTime getLastSundayInMonth(int month, {int? year}) {
  int monthLength = getMonthLengthNumerical(month);
  int day = monthLength;

  while (day > 0) {
    final tempDay = DateTime(year ?? DateTime.now().year, month, day);
    if (tempDay.weekday == DateTime.sunday) {
      return tempDay;
    }
    day--;
  }
  throw StateError('No sunday found');
}

List<DateTime> getSundaysInMonth(int month, {int? year}) {
  int currentYear = year ?? DateTime.now().year;

  final firstDayOfMonth = DateTime(currentYear, month);
  final daysUntilSunday = (DateTime.sunday - firstDayOfMonth.weekday) % 7;

  final tempSundays = List<DateTime>.empty(growable: true);

  for (var i = 0; i < 5; i++) {
    final sunday = firstDayOfMonth.add(
      Duration(
        days: daysUntilSunday + 7 * i,
      ),
    );
    tempSundays.add(sunday);
  }
  final sundays = tempSundays.where((date) => date.month == month).toList();
  return sundays;
}

int getMonthLengthNumerical(int month, {int? year}) {
  final isLeap = isLeapYear(year ?? DateTime.now().year);

  switch (month) {
    case 1:
      return 31;
    case 2:
      return isLeap ? 29 : 28;
    case 3:
      return 31;
    case 4:
      return 30;
    case 5:
      return 31;
    case 6:
      return 30;
    case 7:
      return 31;
    case 8:
      return 31;
    case 9:
      return 30;
    case 10:
      return 31;
    case 11:
      return 30;
    case 12:
      return 31;
    default:
      throw StateError('Wrong month');
  }
}

DateTime getNextSundayFromDate([DateTime? fromDate]) {
  final date = fromDate ?? DateTime.now();
  final daysUntilSunday = (DateTime.sunday - date.weekday) % 7;

  // If today is Sunday, return next Sunday (7 days from now)
  if (daysUntilSunday == 0) {
    return date.add(const Duration(days: 7));
  }

  return date.add(Duration(days: daysUntilSunday));
}

DateTime getPreviousSundayFromDate([DateTime? fromDate]) {
  final date = fromDate ?? DateTime.now();
  final daysSinceSunday = date.weekday % 7;

  if (daysSinceSunday == 0) {
    return date.subtract(Duration(days: 7));
  }

  return date.subtract(Duration(days: daysSinceSunday));
}

/// Get ascending list of trading sundays in current or specified year
List<DateTime> getTradingSundaysInYear([int? year]) {
  final currentYear = year ?? DateTime.now().year;
  final easter = getEasterDateInYear(currentYear);

  final christmassEve = DateTime(currentYear, 12, 24);
  final decemberSundays = getSundaysInMonth(year: currentYear, 12)
      .where((sunday) => sunday.isBefore(christmassEve))
      .toList();
  final eastersPreviousSunday = getPreviousSundayFromDate(easter);
  final sortedDates = [
    getLastSundayInMonth(1, year: currentYear),
    getLastSundayInMonth(4, year: currentYear),
    getLastSundayInMonth(6, year: currentYear),
    getLastSundayInMonth(8, year: currentYear),
    eastersPreviousSunday,
    ...decemberSundays,
  ]..sort((a, b) => a.compareTo(b));

  return sortedDates;
}

DateTime getEasterDateInYear(int year) {
  return getEasterDates().where((date) => date.year == year).first;
}

List<DateTime> getEasterDates() => [
      DateTime(2024, 3, 31),
      DateTime(2025, 4, 20),
      DateTime(2026, 4, 5),
      DateTime(2027, 3, 28),
      DateTime(2028, 4, 16),
      DateTime(2029, 4, 1),
      DateTime(2030, 4, 21),
      DateTime(2031, 4, 13),
      DateTime(2032, 3, 28),
      DateTime(2033, 4, 17),
      DateTime(2034, 4, 9),
      DateTime(2035, 3, 25),
      DateTime(2036, 4, 13),
      DateTime(2037, 4, 5),
      DateTime(2038, 4, 25),
      DateTime(2039, 4, 10),
      DateTime(2040, 4, 1),
      DateTime(2041, 4, 21),
      DateTime(2042, 4, 6),
      DateTime(2043, 3, 29),
      DateTime(2044, 4, 17),
      DateTime(2045, 4, 9),
      DateTime(2046, 3, 25),
      DateTime(2047, 4, 14),
      DateTime(2048, 4, 5),
      DateTime(2049, 4, 18),
      DateTime(2050, 4, 10),
    ];
