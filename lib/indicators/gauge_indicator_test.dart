import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/indicators/gauge_indicator.dart';
import 'package:ui_kit/test_utils/wrap_in_material_app.dart';

void main() {
  group('Gauge Indicator', () {
    testWidgets('validates input values', (WidgetTester tester) async {
      expect(() {
        return const GaugeIndicator(
            width: 200, dangerThreshold: 0.4, safeThreshold: 0.8, score: 0.75);
      }, returnsNormally);

      expect(() {
        final score = DateTime.now().year.toDouble();
        return GaugeIndicator(
            width: 200, dangerThreshold: 0.4, safeThreshold: 0.8, score: score);
      }, throwsAssertionError);
    });

    testWidgets('renders widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(const GaugeIndicator(
          width: 200, dangerThreshold: 0.4, safeThreshold: 0.8, score: 0.75)));

      expect(find.byType(GaugeIndicator), findsOneWidget);
    });
  });
}
