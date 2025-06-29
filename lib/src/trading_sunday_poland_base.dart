import 'sunday_utils.dart';

class TradingSundayPoland {
  static bool isNextSundayTrading() {
    final nextSunday = getNextSundayFromDate();
    final tradingSundays = getTradingSundaysInYear(nextSunday.year);
    return tradingSundays.any((sunday) =>
        sunday.year == nextSunday.year &&
        sunday.month == nextSunday.month &&
        sunday.day == nextSunday.day);
  }

  static bool isTodayTradingSunday() {
    final today = DateTime.now();
    final tradingSundays = getTradingSundaysInYear(today.year);
    return tradingSundays.any((sunday) =>
        sunday.year == today.year &&
        sunday.month == today.month &&
        sunday.day == today.day);
  }

  static DateTime whenIsNextTradingSunday([DateTime? time]) {
    final today = DateTime.now();
    final after = time ?? today;
    final tradingSundays = getTradingSundaysInYear(after.year);

    // Check current year first
    final currentYearTradingSundays =
        tradingSundays.where((sunday) => sunday.isAfter(after)).toList();

    if (currentYearTradingSundays.isNotEmpty) {
      return currentYearTradingSundays.first;
    }

    // If no trading Sundays left this year, check next year
    final nextYearTradingSundays = getTradingSundaysInYear(after.year + 1);
    return nextYearTradingSundays.first;
  }
}
