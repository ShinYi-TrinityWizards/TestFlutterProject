import 'package:flutter/material.dart'; // Import Flutter's material design library
import 'package:flutter_test/flutter_test.dart'; // Import Flutter's testing framework
import 'package:integration_test/integration_test.dart'; // Import the integration testing package
import 'package:myflutterapp/simple_app.dart'; // Import the calculator app file

void main() {
  // Ensure the integration test framework is properly initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Define the test scenario
  testWidgets('Calculator app test', (WidgetTester tester) async {
    // Launch the calculator app
    await tester.pumpWidget(const CalculatorApp());

    // Find the input fields and buttons
    final Finder num1Field = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter first number');
    final Finder num2Field = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter second number');
    final Finder addButton = find.text('+');
    final Finder subtractButton = find.text('-');
    final Finder multiplyButton = find.text('*');
    final Finder divideButton = find.text('/');

    // Enter numbers into the input fields
    await tester.enterText(num1Field, '10');
    await tester.enterText(num2Field, '5');
    await tester.pump(); // Rebuild the widget tree

    // Test addition
    await tester.tap(addButton);
    await tester.pump(); // Rebuild the widget tree
    expect(find.text('Result: 15.0'), findsOneWidget); // Verify the result

    // Test subtraction
    await tester.tap(subtractButton);
    await tester.pump(); // Rebuild the widget tree
    expect(find.text('Result: 5.0'), findsOneWidget); // Verify the result

    // Test multiplication
    await tester.tap(multiplyButton);
    await tester.pump(); // Rebuild the widget tree
    expect(find.text('Result: 50.0'), findsOneWidget); // Verify the result

    // Test division
    await tester.tap(divideButton);
    await tester.pump(); // Rebuild the widget tree
    expect(find.text('Result: 2.0'), findsOneWidget); // Verify the result

    // Test division by zero
    await tester.enterText(num2Field, '0');
    await tester.pump(); // Rebuild the widget tree
    await tester.tap(divideButton);
    await tester.pump(); // Rebuild the widget tree
    expect(find.text('Result: Error'), findsOneWidget); // Verify the result
  });
}