import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'button_common.dart';
import 'button_common_tests.dart';
import 'filled_button.dart';

void main() {
  group('FilledButton', () {
    const buttonText = 'Click me';

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => FilledButton(buttonText, onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({ FutureCallback? onPressed}) => FilledButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? fullWidth}) => FilledButton(buttonText,
          onPressed: () async {}, fullWidth: fullWidth),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow}) =>
          FilledButton(buttonText, onPressed: () async {}, narrow: narrow),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          FilledButton(buttonText, onPressed: () async {}, padding: padding),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow, bool? fullWidth}) => FilledButton(
        buttonText,
        onPressed: () async {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle? textStyle}) => FilledButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () async {},
        narrow: true,
      ),
    );
  });
}
