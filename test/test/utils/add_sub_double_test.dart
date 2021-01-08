import 'package:sample/utils/functions.dart';
import 'package:test/test.dart';

void main() {
  group(
      'Test add and sub double by given number and expect the value with precision by 1',
      () {
    test('add the number 0.6 by 0.1 and expects 0.7', () {
      var results = sumDouble(0.6, 0.1);
      expect(results, 0.7);
    });

    test('add the number 1.0 by 0.1 and expects 1.1', () {
      var results = sumDouble(1.0, 0.1);
      expect(results, 1.1);
    });

    test('sub the number 0.6 by 0.1 and expects 0.5', () {
      var results = subDouble(0.6, 0.1);
      expect(results, 0.5);
    });

    test('add the number 1.0 by 0.1 and expects 0.9', () {
      var results = subDouble(1.0, 0.1);
      expect(results, 0.9);
    });
  });
}
