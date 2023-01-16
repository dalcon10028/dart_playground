import 'package:dart_playground/date_util.dart';
import 'package:test/test.dart';
import 'package:intl/intl.dart';

void main() {
  test('오늘 날짜의 yyyyMMdd를 표기해야 합니다.', () {
    expect(DateUtil.getCurrentYmd(), DateFormat('yyyyMMdd').format(DateTime.now()));
  });

  test('dateTimeToString', () {
    DateTime dateTime = DateTime.parse('2023-01-17');
    expect(DateUtil.dateTimeToString(dateTime, "yyyyMMDD"), '20230117');
  });

  test('getDiffDay', () {
    DateTime dateTime1 = DateTime.parse('2023-01-17');
    DateTime dateTime2 = DateTime.parse('2023-01-19');
    expect(DateUtil.getDiffDay(dateTime2, dateTime1), 2);
  });

  test('getYesterday', () {
    expect(DateUtil.getYesterday(), DateFormat('yyyyMMdd').format(DateTime.now().subtract(Duration(days:1))));
  });
}
