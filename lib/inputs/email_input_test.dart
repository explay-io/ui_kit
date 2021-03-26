import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/inputs/email_input.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('Email create test', () {
    final _textEditingController = TextEditingController();
    void onChangeTextField(String value) {
      _textEditingController.text = value;
    }

    testWidgets('renders Email widget', (WidgetTester tester) async {
      await tester.pumpWidget(
          wrapInMaterialApp(EmailInput(onChanged: onChangeTextField)));
      expect(find.byType(EmailInput), findsOneWidget);
    });
  });
}
