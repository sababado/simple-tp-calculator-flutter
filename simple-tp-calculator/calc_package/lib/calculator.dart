library calc_package;

import 'package:intl/intl.dart';

/// Calculator responsible for determining TP longevity.
class Calculator {
  int tprs = 0;
  int spr = 0;
  int avgSps = 0;
  int burts = 0;

  final numberFormat = new NumberFormat("#.#", "en_US");

  Calculator();

  /// Set all four values [tprs], [spr], [avgSps], and [burts] to calculate a days supply value.
  double calculate() {
    return tprs * spr / avgSps / burts;
  }

  /// Convert the [calculate()] value to a readable string.
  String calculateAsString() {
    double value = calculate();
    return numberFormat.format(value);
  }
}
