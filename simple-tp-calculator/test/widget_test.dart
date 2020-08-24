// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Calculate Value', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the DOS is at zero
    Finder dosValueFinder = find.byKey(Key("dos-value"));
    expect(dosValueFinder, findsOneWidget);
    expect((dosValueFinder.evaluate().single.widget as Text).data, "0");

    // add values in all fields
    await tester.enterText(find.byKey(Key("tpr")), "10");
    await tester.enterText(find.byKey(Key("spr")), "255");
    await tester.enterText(find.byKey(Key("avgSps")), "11");
    await tester.enterText(find.byKey(Key("burts")), "4");
    await tester.pump();

    // verify the DOS has updated
    dosValueFinder = find.byKey(Key("dos-value"));
    expect((dosValueFinder.evaluate().single.widget as Text).data, "58");
  });
}
