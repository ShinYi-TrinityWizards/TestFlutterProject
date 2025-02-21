import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myflutterapp/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter incremented
    expect(find.text('1'), findsOneWidget);
  });
}