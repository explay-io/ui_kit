import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/inputs/pin_view.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('Pin view', () {
    testWidgets('renders correct number of pinview dots',
        (WidgetTester tester) async {
      final pinView = PinView(4, '');
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      // ignore: invalid_use_of_visible_for_testing_member
      expect(find.byType(PinDot), findsNWidgets(4));
    });

    testWidgets('renders correct number of dark pinview dots',
        (WidgetTester tester) async {
      final pinView = PinView(4, 'he');
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      // ignore: invalid_use_of_visible_for_testing_member
      final pindotsFinder = find.byType(PinDot);
      final pinDots =
          // ignore: invalid_use_of_visible_for_testing_member
          pindotsFinder.evaluate().map<PinDot>((e) => e.widget).toList();
      final activeDots = pinDots.where((pinDot) => pinDot.active).toList();
      final inactiveDots = pinDots.where((pinDot) => !pinDot.active).toList();

      expect(activeDots.length, 2);
      expect(inactiveDots.length, 2);
      expect(pinDots.first.active, true);
      expect(pinDots[1].active, true);
      expect(pinDots[2].active, false);
      expect(pinDots[3].active, false);
    });
  });
}
