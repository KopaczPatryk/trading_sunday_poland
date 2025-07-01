import 'sunday_utils.dart';

/// Utility class to access functions
class TradingSundayPoland {
  /// Quckly check if upcoming sunday is trading one
  static bool isNextSundayTrading() {
    final nextSunday = getNextSundayFromDate();
    final tradingSundays = getTradingSundaysInYear(nextSunday.year);
    return tradingSundays.any((sunday) =>
        sunday.year == nextSunday.year &&
        sunday.month == nextSunday.month &&
        sunday.day == nextSunday.day);
  }

  /// Quickly check if today is trading sunday
  static bool isTodayTradingSunday() {
    final today = DateTime.now();
    final tradingSundays = getTradingSundaysInYear(today.year);
    return tradingSundays.any((sunday) =>
        sunday.year == today.year &&
        sunday.month == today.month &&
        sunday.day == today.day);
  }

  /// Check when is next trading sunday. Allows search in future
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
