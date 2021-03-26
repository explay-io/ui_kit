import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/currency_displays/asset_rate.dart';
import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('AssetRate', () {
    testWidgets('renders value', (WidgetTester tester) async {
      const symbol = '€';
      const rate = 8750.1;
      await tester.pumpWidget(wrapInMaterialApp(const AssetRate(symbol, rate)));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
      final RichText richText = find.byType(RichText).evaluate().first.widget;
      final richTextText = richText.text.toPlainText();
      expect(richTextText, '€ 8,750.10');
    });

    testWidgets('renders negative value', (WidgetTester tester) async {
      const symbol = '€';
      const rate = -8701.478;
      await tester.pumpWidget(wrapInMaterialApp(const AssetRate(symbol, rate)));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
      final RichText richText = find.byType(RichText).evaluate().first.widget;
      final richTextText = richText.text.toPlainText();
      expect(richTextText, '€ -8,701.48');
    });
  });
}
