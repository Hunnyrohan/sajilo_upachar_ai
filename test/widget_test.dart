import 'package:flutter_test/flutter_test.dart';

import 'package:sajilo_upachar_ai/main.dart';

void main() {
  testWidgets('App loads and shows login page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SajiloApp());

    // Verify that the login page title is shown.
    expect(find.text('Sajilo Upachar AI'), findsOneWidget);
  });
}
