import 'package:trading_sunday_poland/trading_sunday_poland.dart';

void main() {
  // Get next Sunday from today's date
  final nextSunday = getNextSundayFromDate();
  print('Next Sunday from today: ${nextSunday.toString().split(' ')[0]}');

  // Get previous Sunday from today's date
  final previousSunday = getPreviousSundayFromDate();
  print(
      'Previous Sunday from today: ${previousSunday.toString().split(' ')[0]}');

  // Get next Sunday from a specific date
  final specificDate = DateTime(2024, 1, 15); // A Monday
  final nextSundayFromDate = getNextSundayFromDate(specificDate);
  final previousSundayFromDate = getPreviousSundayFromDate(specificDate);
  print(
      'Next Sunday from $specificDate: ${nextSundayFromDate.toString().split(' ')[0]}');
  print(
      'Previous Sunday from $specificDate: ${previousSundayFromDate.toString().split(' ')[0]}');

  // Example with different days of the week
  final days = [
    DateTime(2024, 1, 15), // Monday
    DateTime(2024, 1, 16), // Tuesday
    DateTime(2024, 1, 17), // Wednesday
    DateTime(2024, 1, 18), // Thursday
    DateTime(2024, 1, 19), // Friday
    DateTime(2024, 1, 20), // Saturday
    DateTime(2024, 1, 21), // Sunday
  ];

  print('\nNext and Previous Sunday from each day of the week:');
  for (final day in days) {
    final nextSunday = getNextSundayFromDate(day);
    final previousSunday = getPreviousSundayFromDate(day);
    final dayName = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][day.weekday - 1];
    print(
      '$dayName (${day.toString().split(' ')[0]})'
      ' -> '
      'Previous: ${previousSunday.toString().split(' ')[0]}, '
      'Next: ${nextSunday.toString().split(' ')[0]}',
    );
  }
}
