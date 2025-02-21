import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myflutterapp/main.dart';

void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify the counter incremented
    expect(find.text('1'), findsOneWidget);
  });
}