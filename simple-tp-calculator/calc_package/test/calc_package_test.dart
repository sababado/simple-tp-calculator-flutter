import 'package:calc_package/calculator.dart';
import 'package:test/test.dart';

void main() {
  group("Calculations", () {
    test('Approximate Correct Calculation', () {
      final calculator = Calculator();
      calculator.tprs = 10;
      calculator.spr = 255;
      calculator.avgSps = 11;
      calculator.burts = 4;

      expect(calculator.calculate().round(), 58);
    });

    test('Exact Correct Calculation', () {
      final calculator = Calculator();
      calculator.tprs = 10;
      calculator.spr = 10;
      calculator.avgSps = 10;
      calculator.burts = 10;

      expect(calculator.calculate(), 1.0);
    });

    test('Zero Inputs Equal Zero Result', () {
      final calculator = Calculator();
      calculator.tprs = 0;
      calculator.spr = 10;
      calculator.avgSps = 10;
      calculator.burts = 10;

      expect(calculator.calculate(), 0.0);

    });
  });
}
