import 'dart:async';

import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils/wrap_in_material_app.dart';
import 'button_common.dart';

class FutureCallbackMock extends Mock implements Function {
  Future<void> call() async {
    // ignore: invalid_use_of_visible_for_testing_member
    return super.noSuchMethod(Invocation.method(#call, []));
  }
}

void defaultSetup () {}

void testTextProp({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  required String buttonText,
  required Widget Function() buildButton,
}) {
  group('text prop', () {
    testWidgets('renders text', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton()));
      expect(find.text(buttonText), findsOneWidget);
    });
  });
}

void testOnPressedProp({
  required Function group,
  required Function setUp,
  required Function testWidgets,
  required String buttonText,
  required Widget Function({ required FutureCallback onPressed, bool enabled }) buildButton,
  required Type underlyingMaterialButtonType,
}) {
  group('onPressed prop', () {
    late Future future;
    late Completer completer;
    late FutureCallback onPressed;

    setUp(() {
      completer = Completer<void>();
      future = completer.future;
      onPressed = FutureCallbackMock();
      when(onPressed()).thenAnswer(((_) =>  future));
    });

    testWidgets('if enabled is false should pass null to unrelying button',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: () {}, enabled: false)));
      expect(
          tester
              .widget<ButtonStyleButton>(find.byType(underlyingMaterialButtonType))
              .enabled,
          isFalse);
    });

    testWidgets('on tap calls onPressed prop', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
      await tester.tap(find.text(buttonText));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('tapping twice results in one call to onPressed',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
      await tester.tap(find.text(buttonText));
      await tester.pump();
      await tester.tap(find.text(buttonText));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('when tapped disables underlying button until future completes',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
        await tester.tap(find.text(buttonText));
        await tester.pump();
        expect(
            tester
                .widget<ButtonStyleButton>(
                    find.byType(underlyingMaterialButtonType))
                .enabled,
            isFalse);
        completer.complete();
        await future;
        await tester.pump();
        expect(
            tester
                .widget<ButtonStyleButton>(
                    find.byType(underlyingMaterialButtonType))
                .enabled,
            isTrue);
      });
    });
  });
}

void testFullWidthProp({
  required Function group,
  required Function setUp,
  required Function testWidgets,
  String buttonText = '',
  required Widget Function({ required bool fullWidth }) buildButton,
  Type? underlyingMaterialButtonType,
}) {
  group('fullWidth prop', () {
    TestWidgetsFlutterBinding binding;

    setUp(() {
      binding = TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;
      binding.window.physicalSizeTestValue = const Size(400, 200);
      binding.window.devicePixelRatioTestValue = 1.0;
    });

    testWidgets('if true renders in full width', (WidgetTester tester) async {
      final button = buildButton(fullWidth: true);
      await tester.pumpWidget(wrapInMaterialApp(button));
      final buttonWidth =
          tester.element(find.byType(button.runtimeType)).size!.width;
      expect(buttonWidth, 400.0);
    });

    testWidgets('if false does not render full width',
        (WidgetTester tester) async {
      final button = buildButton(fullWidth: false);
      await tester.pumpWidget(wrapInMaterialApp(button));

      final buttonWidth =
          tester.element(find.byType(button.runtimeType)).size!.width;
      expect(buttonWidth, 224.0);
    });
  });
}

void testNarrowProp({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  String buttonText = '',
  required Widget Function({ required bool narrow }) buildButton,
  required Type underlyingMaterialButtonType,
}) {
  group('narrow prop', () {
    const interactiveStates = <MaterialState>{};
    testWidgets('if true renders smaller padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(narrow: true)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType).evaluate().single.widget
              as ButtonStyleButton;
      final padding = button.style!.padding!.resolve(interactiveStates);
      expect(padding, ButtonStyleConstants.narrowPadding);
    });

    testWidgets('if false renders larger padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(narrow: false)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType).evaluate().single.widget
              as ButtonStyleButton;
      final padding = button.style!.padding!.resolve(interactiveStates);
      expect(padding, ButtonStyleConstants.widePadding);
    });
  });
}

void testPaddingProp({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  String buttonText = '',
  required Widget Function({ EdgeInsets? padding }) buildButton,
  required Type underlyingMaterialButtonType,
}) {
  group('padding prop', () {
    const interactiveStates = <MaterialState>{};
    testWidgets('if padding is passed, overwrite default',
        (WidgetTester tester) async {
      final padding = EdgeInsets.all(8.0);
      await tester.pumpWidget(wrapInMaterialApp(buildButton(padding: padding)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType).evaluate().single.widget
              as ButtonStyleButton;
      expect(button.style!.padding!.resolve(interactiveStates), padding);
    });

    testWidgets('if padding is null, defaults to', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(padding: null)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType).evaluate().single.widget
              as ButtonStyleButton;
      final verticalPadding = button.style!.padding!.resolve(interactiveStates)!.vertical;
      expect(verticalPadding, 2 * ButtonStyleConstants.wideVerticalPadding);
    });
  });
}

void testFontSize({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  required String buttonText,
  required Widget Function({ required bool fullWidth, required bool narrow }) buildButton,
}) {
  group('font size', () {
    testWidgets(
        'if fullWidth is false and narrow is true, the font size becomes smaller',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(
        fullWidth: false,
        narrow: true,
      )));
      expect(tester.widget<Text>(find.text(buttonText)).style!.fontSize,
          ButtonStyleConstants.smallFontSize);
    });
  });
}

void testFontStyle({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  required String buttonText,
  TextStyle? textStyle,
  required Widget Function({ TextStyle textStyle }) buildButton,
}) {
  group('font text style', () {
    testWidgets('text style is set', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton(textStyle: AppText.body2)));
      expect(tester.widget<Text>(find.text(buttonText)).style!.fontSize,
          ButtonStyleConstants.smallFontSize);
    });
  });
}

void testPressingState({
  required Function group,
  Function setUp = defaultSetup,
  required Function testWidgets,
  required String buttonText,
  required Widget Function({
    required FutureCallback onPressed, bool enabled
  }) buildButton,
}) {
  group('pressing state', () {
    testWidgets('when button is pressed it changes text color',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: () {})));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.blue);
      final gesture = await tester.createGesture();
      await gesture.down(tester.getCenter(find.text(buttonText)));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.darkerBlue);
      await gesture.up();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.blue);
    });

    testWidgets(
        'if button is disabled should have grey text regardless of tap events',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: () {}, enabled: false)));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.mediumGrey);
      final gesture = await tester.createGesture();
      await gesture.down(tester.getCenter(find.text(buttonText)));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.mediumGrey);
      await gesture.up();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(tester.widget<Text>(find.text(buttonText)).style!.color,
          AppColor.mediumGrey);
    });
  });
}
