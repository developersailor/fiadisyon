import 'package:fiadisyon/product/utility/date/extensions/date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('date time extension types test', () {
    test('formattedDate', () {
      final date = FiDate(DateTime(2021));
      expect(date.formattedDate, '1/1/2021');
    });
    test('readableDate', () {
      final date = FiDate(DateTime(2021));
      expect(date.readableDate, '1 1 2021');
    });
  });
}
