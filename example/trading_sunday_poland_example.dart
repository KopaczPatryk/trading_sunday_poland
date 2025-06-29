import 'package:trading_sunday_poland/trading_sunday_poland.dart';

void main() {
  TradingSundayPoland.isTodayTradingSunday();
  TradingSundayPoland.isNextSundayTrading();
  TradingSundayPoland.whenIsNextTradingSunday();

  //Get first trading sunday in 2026
  TradingSundayPoland.whenIsNextTradingSunday(DateTime(2026));

  final currentYear = DateTime.now().year;
  final tradingSundays = getTradingSundaysInYear(currentYear);

  print('Trading Sundays in $currentYear:');
  for (final sunday in tradingSundays) {
    print('  - ${sunday.toString().split(' ')[0]}');
  }
}
