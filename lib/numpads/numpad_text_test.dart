import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/numpads/numpad_text.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('NumPadText create test', () {
    final _textEditingController = TextEditingController();
    void onChangeTextField(String value) {
      _textEditingController.text = value;
    }

    testWidgets('renders numpad widget', (WidgetTester tester) async {
      await tester.pumpWidget(
          wrapInMaterialApp(NumPadText(onChange: onChangeTextField)));
      expect(find.widgetWithIcon(NumPadText, Icons.arrow_back), findsOneWidget);
    });
  });

  group('NumPadText input', () {
    final _textEditingController = TextEditingController();
    void onChange(String value) {
      _textEditingController.text = value;
    }

    testWidgets('on tap key tests', (WidgetTester tester) async {
      final testNumPad = NumPadText(onChange: onChange, decimalPlaces: 6);
      await tester.pumpWidget(wrapInMaterialApp(testNumPad));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('4'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('6'));
      await tester.tap(find.text('7'));
      await tester.tap(find.text('8'));
      await tester.pump();
      expect(_textEditingController.text, '123.123456');
    });
  });
}
