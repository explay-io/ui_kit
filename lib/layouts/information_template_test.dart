import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/buttons/filled_button.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/illustrations/undraw.dart';
import 'package:ui_kit/illustrations/undraw_illustrations.dart';

import '../test_utils/wrap_in_material_app.dart';
import 'information_template.dart';

void main() {
  group('InformationTemplate', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Header';
      const text = 'Body';
      final pic = Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      );
      final action = FilledButton(
        'Button',
        onPressed: () async {},
        fullWidth: true,
        narrow: false,
      );

      const backbutton = BackButton();

      await tester.pumpWidget(wrapInMaterialApp(InformationTemplate(
        header,
        text,
        pic,
        action,
        leadingWidget: backbutton,
      )));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(BackButton), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(Undraw), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
    });
  });
}
