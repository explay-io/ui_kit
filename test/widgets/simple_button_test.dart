import 'package:ui_kit/widgets/buttons/button_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/widgets/buttons/simple_button.dart';

import 'common_button_tests.dart';

void main() {
  group('TextButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) =>
          SimpleButton(buttonText, onPressed: onPressed),
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
      buildButton: ({FutureCallback onPressed}) =>
          SimpleButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: TextButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) =>
          SimpleButton(buttonText, onPressed: () async {}, padding: padding),
      underlyingMaterialButtonType: TextButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => SimpleButton(buttonText,
          textStyle: textStyle, onPressed: () async {}),
    );
  });
}
