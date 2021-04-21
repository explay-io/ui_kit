import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/buttons/simple_button.dart';

import 'button_common.dart';
import 'button_common_tests.dart';

void main() {
  group('TextButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({ required FutureCallback onPressed, bool enabled = true }) =>
          SimpleButton(buttonText, onPressed: onPressed, enabled: enabled),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => SimpleButton(buttonText, onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({required FutureCallback onPressed, bool enabled = true}) =>
          SimpleButton(buttonText, onPressed: onPressed, enabled: enabled),
      underlyingMaterialButtonType: TextButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({ EdgeInsetsGeometry? padding}) => padding != null
        ? SimpleButton(buttonText, onPressed: () async {}, padding: padding)
        : SimpleButton(buttonText, onPressed: () async {}),
      underlyingMaterialButtonType: TextButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle? textStyle}) => SimpleButton(buttonText,
          textStyle: textStyle, onPressed: () async {}),
    );
  });
}
