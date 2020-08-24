import 'package:intl/intl.dart';

class Calculator {
  int tprs = 0;
  int spr = 0;
  int avgSps = 0;
  int burts = 0;

  final numberFormat = new NumberFormat("#.#", "en_US");

  Calculator();

  double calculate() {
    return tprs * spr / avgSps / burts;
  }

  String calculateAsString() {
    double value = calculate();
    return numberFormat.format(value);
  }
}
