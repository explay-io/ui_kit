import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/widgets/filled_button.dart';
import 'package:ui_kit/widgets/layout/utility_template.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('UtilityTemplate', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Lorem Ipsum';
      const text =
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
      final pic = SvgPicture.asset(
        'assets/update-app.svg',
        width: 285.0,
        height: 215.0,
      );
      final action = FilledButton(
        'Button Text',
        onPressed: () {},
        fullWidth: true,
        narrow: false,
      );
      await tester.pumpWidget(wrapInMaterialApp(UtilityTemplate(header, text, pic, action)));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Button Text'), findsOneWidget);
    });
  });
}
