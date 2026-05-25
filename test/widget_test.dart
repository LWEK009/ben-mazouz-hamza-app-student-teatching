import 'package:flutter_test/flutter_test.dart';
import 'package:manaret_al_lougha/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ManaretApp());
    expect(find.text('منارة اللغة العربية'), findsOneWidget);
  });
}
