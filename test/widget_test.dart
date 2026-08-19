import 'package:flutter_test/flutter_test.dart';

import 'package:met_inz_web_app/main.dart';

void main() {
  testWidgets('Home page renders hero and nav', (WidgetTester tester) async {
    await tester.pumpWidget(const MetInzenjeringApp());
    await tester.pump();

    expect(find.text('MET INŽENJERING'), findsOneWidget);
    expect(find.textContaining('MET INŽENJERING\nNOVI SAD'), findsOneWidget);
    expect(find.text('Get a Quote'), findsWidgets);
  });
}
