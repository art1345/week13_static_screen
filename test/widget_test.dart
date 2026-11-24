import 'package:flutter_test/flutter_test.dart';

import 'package:week13_static_screen/main.dart';

void main() {
  testWidgets('Home screen shows the main sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CampusApp());

    expect(find.text('FixIt Campus'), findsOneWidget);
    expect(find.text('See something broken?'), findsOneWidget);
    expect(find.text('My recent reports'), findsOneWidget);

    await tester.tap(find.text('Report a Concern'));
    await tester.pumpAndSettle();

    expect(find.text("What's the issue?"), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);

    await tester.tap(find.text('Broken lights'));
    await tester.pumpAndSettle();

    expect(find.text('Report Details'), findsOneWidget);
    expect(find.text('Flickering ceiling light'), findsOneWidget);
  });
}
