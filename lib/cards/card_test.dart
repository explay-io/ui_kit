import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/cards/card.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('AppCard', () {
    const underlyingWidget = Container;

    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
          wrapInMaterialApp(const AppCard(child: Text('Text Content'))));

      expect(find.text('Text Content'), findsOneWidget);
    });

    testWidgets('sets correct default properties', (WidgetTester tester) async {
      const child = Text('Text Content');
      await tester.pumpWidget(wrapInMaterialApp(const AppCard(child: child)));

      final widget = tester.widget(find.byType(underlyingWidget));
      final Container containerWidget = widget;
      expect(containerWidget.margin, EdgeInsets.zero);
      expect(containerWidget.child, child);

      final BoxDecoration decoration = containerWidget.decoration;
      expect(decoration.color, AppColor.deepWhite);
      expect(
          decoration.borderRadius, const BorderRadius.all(Radius.circular(4)));
      expect(decoration.boxShadow, [
        const BoxShadow(
            color: AppColor.shadowColor,
            offset: Offset(0.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: 0.0)
      ]);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      const child = Text('Text Content');
      await tester.pumpWidget(wrapInMaterialApp(const AppCard(
        elevation: 3,
        margin: EdgeInsets.all(11.0),
        borderRadius: 1,
        child: child,
      )));

      final widget = tester.widget(find.byType(underlyingWidget));
      final Container containerWidget = widget;
      expect(containerWidget.margin, const EdgeInsets.all(11.0));
      expect(containerWidget.child, child);

      final BoxDecoration decoration = containerWidget.decoration;
      expect(decoration.color, AppColor.deepWhite);
      expect(
          decoration.borderRadius, const BorderRadius.all(Radius.circular(1)));
      expect(decoration.boxShadow, [
        const BoxShadow(
            color: AppColor.shadowColor,
            offset: Offset(0.0, 5.0),
            blurRadius: 15.0,
            spreadRadius: 0.0)
      ]);
    });
  });
}
