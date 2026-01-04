import 'package:flutter_clean_architecture_2/2_application/app/basic_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Basic smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BasicApp());

    expect(find.text('1'), findsNothing);
  });
}
