import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/buttons/filled_button.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/illustrations/undraw.dart';
import 'package:ui_kit/illustrations/undraw_illustrations.dart';
import 'package:ui_kit/layouts/utility_template.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('UtilityTemplate', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Lorem Ipsum';
      const text =
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
      final pic = Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      );
      final action = FilledButton(
        'Lorem Ipsum',
        onPressed: () async {},
        fullWidth: true,
        narrow: false,
      );
      await tester.pumpWidget(
          wrapInMaterialApp(UtilityTemplate(header, text, pic, action)));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(Undraw), findsOneWidget);
      expect(find.text('Lorem Ipsum'), findsOneWidget);
    }, skip: true);
  });
}
