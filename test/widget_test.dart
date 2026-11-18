import 'package:flutter_test/flutter_test.dart';

import 'package:pas/main.dart';

void main() {
  testWidgets('Halaman login tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Masuk'), findsWidgets);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}
