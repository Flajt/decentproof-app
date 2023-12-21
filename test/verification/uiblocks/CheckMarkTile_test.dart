import 'package:decentproof/features/verification/uiblocks/CheckMarkTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CheckmarkTile", () {
    testWidgets("should show checkmark icon if value == true",
        (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
          home: Scaffold(body: CheckMarkTile(title: "", value: true))));
      final finder = find.byIcon(Icons.check);
      expect(finder, findsOneWidget);
    });

    testWidgets("should show close if value == false ", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
          home: Scaffold(body: CheckMarkTile(title: "", value: false))));
      final finder = find.byIcon(Icons.close);
      expect(finder, findsOneWidget);
    });
    testWidgets("should have correct title", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
          home:
              Scaffold(body: CheckMarkTile(title: "My Title", value: false))));
      final iconFinder = find.byIcon(Icons.close);
      final textFinder = find.text("My Title");
      expect(iconFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);
    });
  });
}
