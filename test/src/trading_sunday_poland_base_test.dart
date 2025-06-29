import 'package:test/test.dart';
import 'package:trading_sunday_poland/src/sunday_utils.dart';

void main() {
  group('Specific dates', () {
    test('verify 2025.06.29 is a trading Sunday', () {
      final tradingSundays = getTradingSundaysInYear(2025);
      final targetDate = DateTime(2025, 6, 29);

      // Verify the date is a Sunday
      expect(targetDate.weekday, DateTime.sunday);

      // Verify it's included in trading Sundays
      expect(
          tradingSundays.any((sunday) =>
              sunday.year == targetDate.year &&
              sunday.month == targetDate.month &&
              sunday.day == targetDate.day),
          true);

      // Verify it's the last Sunday in June 2025
      final juneSundays = getSundaysInMonth(year: 2025, 6);
      final lastSundayInJune = juneSundays.last;
      expect(targetDate, lastSundayInJune);
    });
  });
}
