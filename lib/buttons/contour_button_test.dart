import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'button_common.dart';
import 'button_common_tests.dart';
import 'contour_button.dart';

void main() {
  group('ContourButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) =>
          ContourButton(buttonText, onPressed: onPressed),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => ContourButton(buttonText, onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback? onPressed}) =>
          ContourButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? fullWidth}) => ContourButton(buttonText,
          onPressed: () async {}, fullWidth: fullWidth),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow}) =>
          ContourButton(buttonText, onPressed: () async {}, narrow: narrow),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          ContourButton(buttonText, onPressed: () async {}, padding: padding),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow, bool? fullWidth}) => ContourButton(
        buttonText,
        onPressed: () async {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );
  });
}
