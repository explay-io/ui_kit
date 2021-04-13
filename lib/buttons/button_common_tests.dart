import 'dart:async';

import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils/wrap_in_material_app.dart';
import 'button_common.dart';

class FutureCallbackMock extends Mock implements Function {
  Future<void> call();
}

void testTextProp({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
}) {
  group('text prop', () {
    testWidgets!('renders text', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!()));
      expect(find.text(buttonText!), findsOneWidget);
    });
  });
}

void testOnPressedProp({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
  Type? underlyingMaterialButtonType,
}) {
  group('onPressed prop', () {
    Future? future;
    late Completer completer;
    late FutureCallback onPressed;

    setUp!(() {
      completer = Completer<void>();
      future = completer.future;
      onPressed = FutureCallbackMock().call;
      when(onPressed()).thenAnswer(((_) => future!) as Future<void> Function(Invocation));
    });

    testWidgets!('if onPressed is null should pass null to unrelying button',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(onPressed: null)));
      expect(
          tester
              .widget<MaterialButton>(find.byType(underlyingMaterialButtonType!))
              .enabled,
          isFalse);
    }, skip: true);

    testWidgets('on tap calls onPressed prop', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton!(onPressed: onPressed)));
      await tester.tap(find.text(buttonText!));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('tapping twice results in one call to onPressed',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton!(onPressed: onPressed)));
      await tester.tap(find.text(buttonText!));
      await tester.pump();
      await tester.tap(find.text(buttonText));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('when tapped disables underlying button until future completes',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester
            .pumpWidget(wrapInMaterialApp(buildButton!(onPressed: onPressed)));
        await tester.tap(find.text(buttonText!));
        await tester.pump();
        expect(
            tester
                .widget<MaterialButton>(
                    find.byType(underlyingMaterialButtonType!))
                .enabled,
            isFalse);
        completer.complete();
        await future;
        await tester.pump();
        expect(
            tester
                .widget<MaterialButton>(
                    find.byType(underlyingMaterialButtonType))
                .enabled,
            isTrue);
      });
    }, skip: true);
  });
}

void testFullWidthProp({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
  Type? underlyingMaterialButtonType,
}) {
  group('fullWidth prop', () {
    TestWidgetsFlutterBinding binding;

    setUp!(() {
      binding = TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;
      binding.window.physicalSizeTestValue = const Size(400, 200);
      binding.window.devicePixelRatioTestValue = 1.0;
    });

    testWidgets!('if true renders in full width', (WidgetTester tester) async {
      final Widget? button = buildButton!(fullWidth: true);
      await tester.pumpWidget(wrapInMaterialApp(button));
      final buttonWidth =
          tester.element(find.byType(button.runtimeType)).size!.width;
      expect(buttonWidth, 400.0);
    });

    testWidgets('if false does not render full width',
        (WidgetTester tester) async {
      final Widget? button = buildButton!(fullWidth: false);
      await tester.pumpWidget(wrapInMaterialApp(button));

      final buttonWidth =
          tester.element(find.byType(button.runtimeType)).size!.width;
      expect(buttonWidth, 224.0);
    });
  });
}

void testNarrowProp({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
  Type? underlyingMaterialButtonType,
}) {
  group('narrow prop', () {
    testWidgets!('if true renders smaller padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(narrow: true)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType!).evaluate().single.widget
              as MaterialButton;
      expect(button.padding, ButtonStyleConstants.narrowPadding);
    }, skip: true);

    testWidgets('if false renders larger padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(narrow: false)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType!).evaluate().single.widget
              as MaterialButton;
      expect(button.padding, ButtonStyleConstants.widePadding);
    }, skip: true);
  });
}

void testPaddingProp({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
  Type? underlyingMaterialButtonType,
}) {
  group('padding prop', () {
    testWidgets!('if padding is passed, overwrite default',
        (WidgetTester tester) async {
      const padding = EdgeInsets.all(8.0);
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(padding: padding)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType!).evaluate().single.widget
              as MaterialButton;
      expect(button.padding, padding);
    }, skip: true);

    testWidgets('if padding is null, defaults to', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(padding: null)));
      final button =
          // ignore: avoid_as
          find.byType(underlyingMaterialButtonType!).evaluate().single.widget
              as MaterialButton;
      expect(button.padding!.vertical,
          2 * ButtonStyleConstants.wideVerticalPadding);
    }, skip: true);
  });
}

void testFontSize({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
}) {
  group('font size', () {
    testWidgets!(
        'if fullWidth is false and narrow is true, the font size becomes smaller',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(
        fullWidth: false,
        narrow: true,
      )));
      expect(tester.widget<Text>(find.text(buttonText!)).style!.fontSize,
          ButtonStyleConstants.smallFontSize);
    });
  });
}

void testFontStyle({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  TextStyle? textStyle,
  Function? buildButton,
}) {
  group('font text style', () {
    testWidgets!('text style is set', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(buildButton!(textStyle: AppText.body2)));
      expect(tester.widget<Text>(find.text(buttonText!)).style!.fontSize,
          ButtonStyleConstants.smallFontSize);
    });
  });
}

void testPressingState({
  required Function group,
  Function? setUp,
  Function? testWidgets,
  String? buttonText,
  Function? buildButton,
}) {
  group('pressing state', () {
    testWidgets!('when button is pressed it changes text color',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(onPressed: () {})));
      expect(tester.widget<Text>(find.text(buttonText!)).style!.color,
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
      await tester.pumpWidget(wrapInMaterialApp(buildButton!(onPressed: null)));
      expect(tester.widget<Text>(find.text(buttonText!)).style!.color,
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
