import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ui_kit/buttons/two_states_button.dart';

import '../test_utils/wrap_in_material_app.dart';
import 'button_common.dart';
import 'button_common_tests.dart';

void defaultSetup () {}
void defaultCallback () {}

void main() {
  group('TwoStatesButton', () {
    const firstText = 'Ready';
    const secondText = 'Go';
    const timerInterval = 5;
    Future future;
    Completer completer;
    late FutureCallback onButtonCallback;

    setUp(() {
      completer = Completer<void>();
      future = completer.future;
      onButtonCallback = FutureCallbackMock().call;
      when(onButtonCallback()).thenAnswer((_) => future);
    });

    void testSwitchTextProp({
      required Function group,
      Function setUp = defaultSetup,
      required Function testWidgets,
      required String firstText,
      required String secondText,
      required int timerInterval,
      required Function buildButton,
    }) {
      group('switch text prop', () {
        testWidgets('renders text', (WidgetTester tester) async {
          await tester.pumpWidget(wrapInMaterialApp(buildButton()));
          expect(find.text(firstText), findsOneWidget);

          await tester.pumpWidget(
              wrapInMaterialApp(
                  buildButton(onButtonCallback: onButtonCallback)),
              Duration(seconds: timerInterval + 1));
          expect(find.text(secondText), findsOneWidget);

          await tester.tap(find.text(secondText));
          await tester.pump();
          verify(onButtonCallback()).called(1);
        });
      });
    }

    testSwitchTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      firstText: firstText,
      secondText: secondText,
      timerInterval: timerInterval,
      buildButton: ({ FutureCallback onButtonCallback = defaultCallback }) => TwoStatesButton(
          firstText, secondText, timerInterval,
          onButtonCallback: onButtonCallback, onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({ required FutureCallback onPressed, bool enabled = true}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        enabled: enabled,
        onPressed: onPressed,
        onButtonCallback: () {},
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({required bool narrow}) => TwoStatesButton(
          firstText, secondText, timerInterval,
          onPressed: () async {}, onButtonCallback: () {}, narrow: narrow),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({EdgeInsetsGeometry? padding}) => TwoStatesButton(
          firstText, secondText, timerInterval,
          onPressed: () async {}, onButtonCallback: () {}, padding: padding),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({required bool narrow, required bool fullWidth}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        onPressed: () async {},
        onButtonCallback: () {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({TextStyle? textStyle}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        textStyle: textStyle,
        onButtonCallback: () async {},
        onPressed: () async {},
        narrow: true,
      ),
    );
  });
}
