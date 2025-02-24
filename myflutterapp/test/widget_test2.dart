import 'package:flutter/material.dart'; // Import Flutter's material design library
import 'package:flutter_test/flutter_test.dart'; // Import Flutter's testing framework
import 'package:myflutterapp/simple_app.dart'; // Import the calculator app file

void main() {
  group('CalculatorApp Widget Tests', () {
    testWidgets('Perform addition', (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());

      // Find the input fields and buttons
      final Finder num1Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter first number');
      final Finder num2Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter second number');
      final Finder addButton = find.text('+');

      // Enter numbers into the input fields
      await tester.enterText(num1Field, '10');
      await tester.enterText(num2Field, '5');
      await tester.pump(); // Rebuild the widget tree

      // Perform addition
      await tester.tap(addButton);
      await tester.pump(); // Rebuild the widget tree

      // Verify the result
      expect(find.text('Result: 15.0'), findsOneWidget);
    });

    testWidgets('Perform subtraction', (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());

      // Find the input fields and buttons
      final Finder num1Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter first number');
      final Finder num2Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter second number');
      final Finder subtractButton = find.text('-');

      // Enter numbers into the input fields
      await tester.enterText(num1Field, '10');
      await tester.enterText(num2Field, '5');
      await tester.pump(); // Rebuild the widget tree

      // Perform subtraction
      await tester.tap(subtractButton);
      await tester.pump(); // Rebuild the widget tree

      // Verify the result
      expect(find.text('Result: 5.0'), findsOneWidget);
    });

    testWidgets('Perform multiplication', (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());

      // Find the input fields and buttons
      final Finder num1Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter first number');
      final Finder num2Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter second number');
      final Finder multiplyButton = find.text('*');

      // Enter numbers into the input fields
      await tester.enterText(num1Field, '10');
      await tester.enterText(num2Field, '5');
      await tester.pump(); // Rebuild the widget tree

      // Perform multiplication
      await tester.tap(multiplyButton);
      await tester.pump(); // Rebuild the widget tree

      // Verify the result
      expect(find.text('Result: 50.0'), findsOneWidget);
    });

    testWidgets('Perform division', (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());

      // Find the input fields and buttons
      final Finder num1Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter first number');
      final Finder num2Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter second number');
      final Finder divideButton = find.text('/');

      // Enter numbers into the input fields
      await tester.enterText(num1Field, '10');
      await tester.enterText(num2Field, '5');
      await tester.pump(); // Rebuild the widget tree

      // Perform division
      await tester.tap(divideButton);
      await tester.pump(); // Rebuild the widget tree

      // Verify the result
      expect(find.text('Result: 2.0'), findsOneWidget);
    });

    testWidgets('Perform division by zero', (WidgetTester tester) async {
      await tester.pumpWidget(const CalculatorApp());

      // Find the input fields and buttons
      final Finder num1Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter first number');
      final Finder num2Field = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.labelText == 'Enter second number');
      final Finder divideButton = find.text('/');

      // Enter numbers into the input fields
      await tester.enterText(num1Field, '10');
      await tester.enterText(num2Field, '0');
      await tester.pump(); // Rebuild the widget tree

      // Perform division by zero
      await tester.tap(divideButton);
      await tester.pump(); // Rebuild the widget tree

      // Verify the result
      expect(find.text('Result: Error'), findsOneWidget);
    });
  });
}
