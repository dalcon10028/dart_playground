import 'package:dart_playground/currency.dart';
import 'package:test/test.dart';

void main() {
  test('usd', () {
    double money = 300;
    expect(getAmountString(money), '\$300.00');
  });

  test('krw', () {
    double money = 300000;
    expect(getAmountString(money, currency: Currency.krw), '300,000 원');
  });
}
