import 'package:flutter/material.dart'; // Imports the Flutter framework for building UI
import 'package:flutter_test/flutter_test.dart'; // Imports the Flutter testing framework
import 'package:integration_test/integration_test.dart'; // Imports the integration testing package
import 'package:myflutterapp/main.dart'; // Imports the main application file

void main() {
  // Ensures that the integration test is properly initialized.
  // This binds the integration test framework to the Flutter application.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Test for counter incrementing
  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Launches the application by pumping the MyApp widget into the widget tree.
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    // Rebuilds the widget tree to reflect any changes resulting from the tap action.
    await tester.pump();

    // Verify counter incremented
    expect(find.text('1'), findsOneWidget);
  });

  // Test for counter decrementing
  testWidgets('Counter decrements test', (WidgetTester tester) async {
    // Launches the application by pumping the MyApp widget into the widget tree.
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter incremented
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify counter decremented
    expect(find.text('0'), findsOneWidget);
  });

  // Test for counter reset
  testWidgets('Counter reset test', (WidgetTester tester) async {
    // Launches the application by pumping the MyApp widget into the widget tree.
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter incremented
    expect(find.text('1'), findsOneWidget);

    // Tap the 'reset' button (assuming there is a reset button in the UI)
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify counter reset
    expect(find.text('0'), findsOneWidget);
  });

  // Test for counter incrementing multiple times
  testWidgets('Counter multiple increments test', (WidgetTester tester) async {
    // Launches the application by pumping the MyApp widget into the widget tree.
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button 5 times
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }

    // Verify counter incremented
    expect(find.text('5'), findsOneWidget);
  });

  // Test for counter decrementing multiple times
  testWidgets('Counter multiple decrements test', (WidgetTester tester) async {
    // Launches the application by pumping the MyApp widget into the widget tree.
    await tester.pumpWidget(MyApp());

    // Tap the '+' button 5 times
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }

    // Verify counter incremented
    expect(find.text('5'), findsOneWidget);

    // Tap the '-' button 3 times
    for (int i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
    }

    // Verify counter decremented
    expect(find.text('2'), findsOneWidget);
  });
}
