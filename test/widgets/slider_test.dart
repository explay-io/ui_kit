import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/color.dart';
import 'package:ui_kit/widgets/illustrations/undraw.dart';
import 'package:ui_kit/widgets/illustrations/undraw_illustrations.dart';
import 'package:ui_kit/widgets/slider/layout/utility_slide.dart';

import '../wrap_in_material_app.dart';

void main() {
  testWidgets('renders the expected layout', (WidgetTester tester) async {
    const header = 'Some header';
    const text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
    final pic = Undraw(
      color: AppColor.blue,
      illustration: UndrawIllustration.mobile_application,
      width: 285.0,
      height: 215.0,
    );
    await tester.pumpWidget(wrapInMaterialApp(UtilitySlide(header, text, pic)));

    expect(find.text(header), findsOneWidget);
    expect(find.text(text), findsOneWidget);
    expect(find.byType(Undraw), findsOneWidget);
  });
}
