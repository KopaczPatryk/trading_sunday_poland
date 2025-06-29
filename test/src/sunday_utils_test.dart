import 'package:test/test.dart';
import 'package:trading_sunday_poland/src/sunday_utils.dart';

void main() {
  group('year 2024', () {
    test('get trading Sundays for 2024', () {
      final tradingSundays = getTradingSundaysInYear(2024);

      // 2024 Easter is March 31, so previous Sunday is March 24
      // December Sundays before Christmas Eve (Dec 24): Dec 1, 8, 15, 22
      final expectedSundays = [
        DateTime(2024, 1, 28), // Last Sunday in January
        DateTime(2024, 3, 24), // Previous Sunday from Easter (March 31)
        DateTime(2024, 4, 28), // Last Sunday in April
        DateTime(2024, 6, 30), // Last Sunday in June
        DateTime(2024, 8, 25), // Last Sunday in August
        DateTime(2024, 12, 1), // December Sundays before Christmas Eve
        DateTime(2024, 12, 8),
        DateTime(2024, 12, 15),
        DateTime(2024, 12, 22),
      ];

      expect(tradingSundays.length, expectedSundays.length);
      expect(tradingSundays, unorderedEquals(expectedSundays));
    });
    test('get last sundays in 2024', () async {
      final sundays = List.generate(
          12, (month) => getLastSundayInMonth(year: 2024, month + 1).day);

      expect(
        sundays,
        orderedEquals(
          [28, 25, 31, 28, 26, 30, 28, 25, 29, 27, 24, 29],
        ),
      );
    });

    test('get sundays in 2024.12', () {
      final sundays = getSundaysInMonth(year: 2024, 12);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [1, 8, 15, 22, 29],
        ),
      );
    });

    test('get sundays in 2024.03', () {
      final sundays = getSundaysInMonth(year: 2024, 3);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [3, 10, 17, 24, 31],
        ),
      );
    });

    test('get next sunday', () {
      // Test with a Monday (2024-01-15 is a Monday)
      final monday = DateTime(2024, 1, 15);
      final nextSundayFromMonday = getNextSundayFromDate(monday);
      expect(nextSundayFromMonday, DateTime(2024, 1, 21));

      // Test with a Wednesday (2024-01-17 is a Wednesday)
      final wednesday = DateTime(2024, 1, 17);
      final nextSundayFromWednesday = getNextSundayFromDate(wednesday);
      expect(nextSundayFromWednesday, DateTime(2024, 1, 21));

      // Test with a Saturday (2024-01-20 is a Saturday)
      final saturday = DateTime(2024, 1, 20);
      final nextSundayFromSaturday = getNextSundayFromDate(saturday);
      expect(nextSundayFromSaturday, DateTime(2024, 1, 21));

      // Test with a Sunday (2024-01-21 is a Sunday)
      final sunday = DateTime(2024, 1, 21);
      final nextSundayFromSunday = getNextSundayFromDate(sunday);
      expect(nextSundayFromSunday, DateTime(2024, 1, 28));
    });

    test('get previous sunday', () {
      // Test with a Monday (2024-01-15 is a Monday)
      final monday = DateTime(2024, 1, 15);
      final previousSundayFromMonday = getPreviousSundayFromDate(monday);
      expect(previousSundayFromMonday, DateTime(2024, 1, 14));

      // Test with a Tuesday (2024-01-16 is a Tuesday)
      final tuesday = DateTime(2024, 1, 16);
      final previousSundayFromTuesday = getPreviousSundayFromDate(tuesday);
      expect(previousSundayFromTuesday, DateTime(2024, 1, 14));

      // Test with a Wednesday (2024-01-17 is a Wednesday)
      final wednesday = DateTime(2024, 1, 17);
      final previousSundayFromWednesday = getPreviousSundayFromDate(wednesday);
      expect(previousSundayFromWednesday, DateTime(2024, 1, 14));

      // Test with a Saturday (2024-01-20 is a Saturday)
      final saturday = DateTime(2024, 1, 20);
      final previousSundayFromSaturday = getPreviousSundayFromDate(saturday);
      expect(previousSundayFromSaturday, DateTime(2024, 1, 14));

      // Test with a Sunday (2024-01-21 is a Sunday)
      final sunday = DateTime(2024, 1, 21);
      final previousSundayFromSunday = getPreviousSundayFromDate(sunday);
      expect(previousSundayFromSunday, DateTime(2024, 1, 14)); // Same day
    });
  });

  group('year 2025', () {
    test('get trading Sundays for 2025', () {
      final tradingSundays = getTradingSundaysInYear(2025);

      // 2025 Easter is April 20, so previous Sunday is April 13
      // December Sundays before Christmas Eve (Dec 24): Dec 7, 14, 21
      final expectedSundays = [
        DateTime(2025, 1, 26), // Last Sunday in January
        DateTime(2025, 4, 13), // Previous Sunday from Easter (April 20)
        DateTime(2025, 4, 27), // Last Sunday in April
        DateTime(2025, 6, 29), // Last Sunday in June
        DateTime(2025, 8, 31), // Last Sunday in August
        DateTime(2025, 12, 7), // December Sundays before Christmas Eve
        DateTime(2025, 12, 14),
        DateTime(2025, 12, 21),
      ];

      expect(tradingSundays.length, expectedSundays.length);
      expect(tradingSundays, unorderedEquals(expectedSundays));
    });
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

    test('get next sunday', () {
      // Test with a Monday (2025-01-15 is a Monday)
      final monday = DateTime(2025, 1, 15);
      final nextSundayFromMonday = getNextSundayFromDate(monday);
      expect(nextSundayFromMonday, DateTime(2025, 1, 19));

      // Test with a Wednesday (2025-01-17 is a Wednesday)
      final wednesday = DateTime(2025, 1, 17);
      final nextSundayFromWednesday = getNextSundayFromDate(wednesday);
      expect(nextSundayFromWednesday, DateTime(2025, 1, 19));

      // Test with a Sunday (2025-01-19 is a Sunday)
      final sunday = DateTime(2025, 1, 19);
      final nextSundayFromSunday = getNextSundayFromDate(sunday);
      expect(nextSundayFromSunday, DateTime(2025, 1, 26));

      // Test with a Saturday (2025-01-18 is a Saturday)
      final saturday = DateTime(2025, 1, 18);
      final nextSundayFromSaturday = getNextSundayFromDate(saturday);
      expect(nextSundayFromSaturday, DateTime(2025, 1, 19));
    });

    test('get previous sunday', () {
      // Test with a Monday (2025-01-15 is a Monday)
      final monday = DateTime(2025, 1, 15);
      final previousSundayFromMonday = getPreviousSundayFromDate(monday);
      expect(previousSundayFromMonday, DateTime(2025, 1, 12));

      // Test with a Wednesday (2025-01-17 is a Wednesday)
      final wednesday = DateTime(2025, 1, 17);
      final previousSundayFromWednesday = getPreviousSundayFromDate(wednesday);
      expect(previousSundayFromWednesday, DateTime(2025, 1, 12));

      // Test with a Sunday (2025-01-19 is a Sunday)
      final sunday = DateTime(2025, 1, 19);
      final previousSundayFromSunday = getPreviousSundayFromDate(sunday);
      expect(previousSundayFromSunday, DateTime(2025, 1, 12));

      // Test with a Saturday (2025-01-18 is a Saturday)
      final saturday = DateTime(2025, 1, 18);
      final previousSundayFromSaturday = getPreviousSundayFromDate(saturday);
      expect(previousSundayFromSaturday, DateTime(2025, 1, 12));

      // Test with a Tuesday (2025-01-16 is a Tuesday)
      final tuesday = DateTime(2025, 1, 16);
      final previousSundayFromTuesday = getPreviousSundayFromDate(tuesday);
      expect(previousSundayFromTuesday, DateTime(2025, 1, 12));
    });
  });

  group('year 1996', () {
    test('get last sundays in 1996', () async {
      final sundays = List.generate(
          12, (month) => getLastSundayInMonth(year: 1996, month + 1).day);

      expect(
        sundays,
        orderedEquals(
          [28, 25, 31, 28, 26, 30, 28, 25, 29, 27, 24, 29],
        ),
      );
    });

    test('get sundays in 1996.12', () {
      final sundays = getSundaysInMonth(year: 1996, 12);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [1, 8, 15, 22, 29],
        ),
      );
    });

    test('get sundays in 1996.03', () {
      final sundays = getSundaysInMonth(year: 1996, 3);

      expect(
        sundays.map((date) => date.day),
        unorderedEquals(
          [3, 10, 17, 24, 31],
        ),
      );
    });

    test('get next sunday from 1996.01.15', () {
      // Test with a Monday (1996-01-15 is a Monday)
      final monday = DateTime(1996, 1, 15);
      final nextSundayFromMonday = getNextSundayFromDate(monday);
      expect(nextSundayFromMonday, DateTime(1996, 1, 21));

      // Test with a Wednesday (1996-01-17 is a Wednesday)
      final wednesday = DateTime(1996, 1, 17);
      final nextSundayFromWednesday = getNextSundayFromDate(wednesday);
      expect(nextSundayFromWednesday, DateTime(1996, 1, 21));

      // Test with a Sunday (1996-01-21 is a Sunday)
      final sunday = DateTime(1996, 1, 21);
      final nextSundayFromSunday = getNextSundayFromDate(sunday);
      expect(nextSundayFromSunday, DateTime(1996, 1, 28));

      // Test with a Saturday (1996-01-20 is a Saturday)
      final saturday = DateTime(1996, 1, 20);
      final nextSundayFromSaturday = getNextSundayFromDate(saturday);
      expect(nextSundayFromSaturday, DateTime(1996, 1, 21));
    });

    test('get previous sunday from 1996.01.15', () {
      // Test with a Monday (1996-01-15 is a Monday)
      final monday = DateTime(1996, 1, 15);
      final previousSundayFromMonday = getPreviousSundayFromDate(monday);
      expect(previousSundayFromMonday, DateTime(1996, 1, 14));

      // Test with a Wednesday (1996-01-17 is a Wednesday)
      final wednesday = DateTime(1996, 1, 17);
      final previousSundayFromWednesday = getPreviousSundayFromDate(wednesday);
      expect(previousSundayFromWednesday, DateTime(1996, 1, 14));

      // Test with a Sunday (1996-01-21 is a Sunday)
      final sunday = DateTime(1996, 1, 21);
      final previousSundayFromSunday = getPreviousSundayFromDate(sunday);
      expect(previousSundayFromSunday, DateTime(1996, 1, 14));

      // Test with a Saturday (1996-01-20 is a Saturday)
      final saturday = DateTime(1996, 1, 20);
      final previousSundayFromSaturday = getPreviousSundayFromDate(saturday);
      expect(previousSundayFromSaturday, DateTime(1996, 1, 14));

      // Test with a Tuesday (1996-01-16 is a Tuesday)
      final tuesday = DateTime(1996, 1, 16);
      final previousSundayFromTuesday = getPreviousSundayFromDate(tuesday);
      expect(previousSundayFromTuesday, DateTime(1996, 1, 14));
    });
  });
}
