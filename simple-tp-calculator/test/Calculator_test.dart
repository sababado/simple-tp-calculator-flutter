// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/test.dart';
import 'package:app/Calculator.dart';

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
