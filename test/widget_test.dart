// Basic Flutter widget test for EcoLankaApp initialization
import 'package:flutter_test/flutter_test.dart';
import 'package:ecolanka/main.dart';

void main() {
  testWidgets('Counter increment smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EcoLankaApp());
  });
}