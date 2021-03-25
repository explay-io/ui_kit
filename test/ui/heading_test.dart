import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/ui/text/heading.dart';

void main() {
  testWidgets('Heading shows text', (tester) async {
    await tester.pumpWidget(const Directionality(
        textDirection: TextDirection.ltr, child: Heading('Test')));
    expect(find.text('Test'), findsOneWidget);
  });
}
