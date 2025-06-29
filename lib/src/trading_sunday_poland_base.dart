import 'sunday_utils.dart';

abstract class TradingSunday {
  bool isTodayTradingSunday();
  bool isNextSundayTrading();
  DateTime whenIsNextTradingSunday();
}

class TradingSundayImpl implements TradingSunday {
  @override
  bool isNextSundayTrading() {
    final nextSunday = getNextSundayFromDate();
    final tradingSundays = getTradingSundaysInYear(nextSunday.year);
    return tradingSundays.any((sunday) =>
        sunday.year == nextSunday.year &&
        sunday.month == nextSunday.month &&
        sunday.day == nextSunday.day);
  }

  @override
  bool isTodayTradingSunday() {
    final today = DateTime.now();
    final tradingSundays = getTradingSundaysInYear(today.year);
    return tradingSundays.any((sunday) =>
        sunday.year == today.year &&
        sunday.month == today.month &&
        sunday.day == today.day);
  }

  @override
  DateTime whenIsNextTradingSunday() {
    final today = DateTime.now();
    final tradingSundays = getTradingSundaysInYear(today.year);

    // Check current year first
    final currentYearTradingSundays =
        tradingSundays.where((sunday) => sunday.isAfter(today)).toList();

    if (currentYearTradingSundays.isNotEmpty) {
      return currentYearTradingSundays.first;
    }

    // If no trading Sundays left this year, check next year
    final nextYearTradingSundays = getTradingSundaysInYear(today.year + 1);
    return nextYearTradingSundays.first;
  }
}
