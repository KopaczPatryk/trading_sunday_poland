# Trading Sunday Poland

A Dart library for checking trading Sundays in Poland. This package provides utilities to determine which Sundays are designated as trading days in Poland, including special dates like Easter Sunday and Christmas Eve.

## Features

- ✅ Check if today is a trading Sunday
- ✅ Check if the next Sunday is a trading Sunday
- ✅ Find the next trading Sunday from any given date
- ✅ Get all trading Sundays for a specific year
- ✅ Support for years 2024-2050 with Easter date calculations

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  trading_sunday_poland: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Usage

```dart
import 'package:trading_sunday_poland/trading_sunday_poland.dart';

void main() {
  // Check if today is a trading Sunday
  bool isTodayTrading = TradingSundayPoland.isTodayTradingSunday();
  print('Is today a trading Sunday? $isTodayTrading');

  // Check if next Sunday is a trading Sunday
  bool isNextSundayTrading = TradingSundayPoland.isNextSundayTrading();
  print('Is next Sunday a trading Sunday? $isNextSundayTrading');

  // Find the next trading Sunday
  DateTime nextTradingSunday = TradingSundayPoland.whenIsNextTradingSunday();
  print('Next trading Sunday: $nextTradingSunday');

  // Find the next trading Sunday from a specific date
  DateTime nextFromDate = TradingSundayPoland.whenIsNextTradingSunday(
    DateTime(2026, 1, 1)
  );
  print('Next trading Sunday from 2026-01-01: $nextFromDate');
}
```

### Get All Trading Sundays for a Year

```dart
import 'package:trading_sunday_poland/trading_sunday_poland.dart';

void main() {
  final currentYear = DateTime.now().year;
  final tradingSundays = getTradingSundaysInYear(currentYear);

  print('Trading Sundays in $currentYear:');
  for (final sunday in tradingSundays) {
    print('  - ${sunday.toString().split(' ')[0]}');
  }
}
```

## API Reference

### TradingSundayPoland Class

#### `isTodayTradingSunday()`
Returns `true` if today is a trading Sunday in Poland.

```dart
bool isTodayTrading = TradingSundayPoland.isTodayTradingSunday();
```

#### `isNextSundayTrading()`
Returns `true` if the next Sunday is a trading Sunday in Poland.

```dart
bool isNextSundayTrading = TradingSundayPoland.isNextSundayTrading();
```

#### `whenIsNextTradingSunday([DateTime? time])`
Returns the `DateTime` of the next trading Sunday. If no `time` parameter is provided, it uses the current date as the starting point.

```dart
DateTime nextTradingSunday = TradingSundayPoland.whenIsNextTradingSunday();
DateTime nextFromDate = TradingSundayPoland.whenIsNextTradingSunday(DateTime(2026));
```

### Utility Functions

#### `getTradingSundaysInYear([int? year])`
Returns a list of all trading Sundays for the specified year. If no year is provided, it uses the current year.

```dart
List<DateTime> tradingSundays = getTradingSundaysInYear(2025);
```

## Trading Sunday Rules in Poland

Trading Sundays in Poland include:

1. **Last Sunday of January** - January trading Sunday
2. **Last Sunday of April** - April trading Sunday  
3. **Last Sunday of June** - June trading Sunday
4. **Last Sunday of August** - August trading Sunday
5. **Easter Sunday** - The Sunday before Easter
6. **December Sundays** - All Sundays in December before Christmas Eve (December 24th)

## Supported Years

This package includes pre-calculated Easter dates for years **2024-2050**. For years outside this range, you may need to extend the Easter date calculations.

## Example

```dart
import 'package:trading_sunday_poland/trading_sunday_poland.dart';

void main() {
  // Check current status
  print('Today is trading Sunday: ${TradingSundayPoland.isTodayTradingSunday()}');
  print('Next Sunday is trading Sunday: ${TradingSundayPoland.isNextSundayTrading()}');
  
  // Get next trading Sunday
  final nextTrading = TradingSundayPoland.whenIsNextTradingSunday();
  print('Next trading Sunday: ${nextTrading.toString().split(' ')[0]}');
  
  // Get all trading Sundays for current year
  final currentYear = DateTime.now().year;
  final tradingSundays = getTradingSundaysInYear(currentYear);
  
  print('\nTrading Sundays in $currentYear:');
  for (final sunday in tradingSundays) {
    print('  - ${sunday.toString().split(' ')[0]}');
  }
}
```

## License

This project is licensed under the terms specified in the LICENSE file.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Repository

- **GitHub**: https://github.com/KopaczPatryk/trading_sunday_poland
