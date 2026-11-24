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
  });
}
