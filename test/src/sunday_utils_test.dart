import 'package:test/test.dart';
import 'package:trading_sunday_poland/src/sunday_utils.dart';

void main() {
  group('year 2024', () {
    test('get sundays in 2024, 12', () {
      final sundays = getSundaysInMonth(year: 2024, 12);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [1, 8, 15, 22, 29],
        ),
      );
    });

    test('get next sunday from 2024.01.15', () {
      // Test with a Monday (2024-01-15 is a Monday)
      final monday = DateTime(2024, 1, 15);
      final nextSundayFromMonday = getNextSundayFromDate(monday);
      expect(nextSundayFromMonday, DateTime(2024, 1, 21));

      // Test with a Wednesday (2024-01-17 is a Wednesday)
      final wednesday = DateTime(2024, 1, 17);
      final nextSundayFromWednesday = getNextSundayFromDate(wednesday);
      expect(nextSundayFromWednesday, DateTime(2024, 1, 21));

      // Test with a Sunday (2024-01-21 is a Sunday)
      final sunday = DateTime(2024, 1, 21);
      final nextSundayFromSunday = getNextSundayFromDate(sunday);
      expect(nextSundayFromSunday, DateTime(2024, 1, 28));

      // Test with a Saturday (2024-01-20 is a Saturday)
      final saturday = DateTime(2024, 1, 20);
      final nextSundayFromSaturday = getNextSundayFromDate(saturday);
      expect(nextSundayFromSaturday, DateTime(2024, 1, 21));
    });

    test('get previous sunday from 2024.01.15', () {
      // Test with a Monday (2024-01-15 is a Monday)
      final monday = DateTime(2024, 1, 15);
      final previousSundayFromMonday = getPreviousSundayFromDate(monday);
      expect(previousSundayFromMonday, DateTime(2024, 1, 14));

      // Test with a Wednesday (2024-01-17 is a Wednesday)
      final wednesday = DateTime(2024, 1, 17);
      final previousSundayFromWednesday = getPreviousSundayFromDate(wednesday);
      expect(previousSundayFromWednesday, DateTime(2024, 1, 14));

      // Test with a Sunday (2024-01-21 is a Sunday)
      final sunday = DateTime(2024, 1, 21);
      final previousSundayFromSunday = getPreviousSundayFromDate(sunday);
      expect(previousSundayFromSunday, DateTime(2024, 1, 21)); // Same day

      // Test with a Saturday (2024-01-20 is a Saturday)
      final saturday = DateTime(2024, 1, 20);
      final previousSundayFromSaturday = getPreviousSundayFromDate(saturday);
      expect(previousSundayFromSaturday, DateTime(2024, 1, 14));

      // Test with a Tuesday (2024-01-16 is a Tuesday)
      final tuesday = DateTime(2024, 1, 16);
      final previousSundayFromTuesday = getPreviousSundayFromDate(tuesday);
      expect(previousSundayFromTuesday, DateTime(2024, 1, 14));
    });
  });

  group('year 2025', () {
    test('get last sundays in 2025', () async {
      final sundays = List.generate(
          12, (month) => getLastSundayInMonth(year: 2025, month + 1).day);

      expect(
        sundays,
        orderedEquals(
          [26, 23, 30, 27, 25, 29, 27, 31, 28, 26, 30, 28],
        ),
      );
    });

    test('get sundays in 2025.12', () {
      final sundays = getSundaysInMonth(year: 2025, 12);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [7, 14, 21, 28],
        ),
      );
    });

    test('get sundays in 2025.03', () {
      final sundays = getSundaysInMonth(year: 2025, 3);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [2, 9, 16, 23, 30],
        ),
      );
    });
  });

  group('today', () {
    test('get next sunday from today', () {
      final today = DateTime.now();
      final nextSunday = getNextSundayFromDate();

      // Verify it's a Sunday
      expect(nextSunday.weekday, DateTime.sunday);

      // Verify it's in the future
      expect(nextSunday.isAfter(today), true);

      // Verify it's within 7 days (unless today is Sunday)
      if (today.weekday != DateTime.sunday) {
        expect(nextSunday.difference(today).inDays, lessThan(8));
      } else {
        expect(nextSunday.difference(today).inDays, equals(7));
      }
    });

    test('get previous sunday from today', () {
      final today = DateTime.now();
      final previousSunday = getPreviousSundayFromDate();

      // Verify it's a Sunday
      expect(previousSunday.weekday, DateTime.sunday);

      // Verify it's not in the future (unless today is Sunday)
      if (today.weekday != DateTime.sunday) {
        expect(
            previousSunday.isBefore(today) ||
                previousSunday.isAtSameMomentAs(today),
            true);
      } else {
        expect(previousSunday.isAtSameMomentAs(today), true);
      }

      // Verify it's within 7 days in the past (unless today is Sunday)
      if (today.weekday != DateTime.sunday) {
        expect(today.difference(previousSunday).inDays, lessThan(8));
      } else {
        expect(today.difference(previousSunday).inDays, equals(0));
      }
    });
  });
}
