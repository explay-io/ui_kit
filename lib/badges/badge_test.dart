import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:shimmer/shimmer.dart';

import '../test_utils/wrap_in_material_app.dart';
import 'badge.dart';
import 'multivalue_badge.dart';

void main() {
  group('Badge', () {
    testWidgets('renders simple badge widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(const Badge('Badge Content',
          minWidth: 80.0,
          textStyle: TextStyle(color: AppColor.red, fontSize: 16.0),
          bgColor: AppColor.blue)));

      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.text('Badge Content'), findsOneWidget);
      final widget = tester.widget(find.byType(Container));
      final containerWidget = widget as Container;
      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, AppColor.blue);
      expect(
          decoration.borderRadius, const BorderRadius.all(Radius.circular(15)));

      final constrains = containerWidget.constraints!;
      expect(constrains.minWidth, 80.0);
    });
  });

  testWidgets('renders multivalue badge widget', (WidgetTester tester) async {
    await tester.pumpWidget(wrapInMaterialApp(MultiValueBadge(
        const ['Badge Content1', 'Badge Content2'],
        minWidth: 80.0,
        textStyle: const TextStyle(color: AppColor.red, fontSize: 16.0),
        bgColor: AppColor.blue)));

    expect(find.byType(Shimmer), findsOneWidget);
    expect(find.text('Badge Content1'), findsOneWidget);
    final widget = tester.widget(find.byType(Container));
    final containerWidget = widget as Container;
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, AppColor.blue);
    expect(
        decoration.borderRadius, const BorderRadius.all(Radius.circular(15)));

    final constrains = containerWidget.constraints!;
    expect(constrains.minWidth, 80.0);

    await tester.tap(find.text('Badge Content1'));
    await tester.pump();
    expect(find.text('Badge Content2'), findsOneWidget);
  });
}
